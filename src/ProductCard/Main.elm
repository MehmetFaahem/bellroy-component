module ProductCard.Main exposing (main, Model, Msg, init, update, view)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Http
import Json.Decode as Decode exposing (Decoder, field, string, float)


-- MAIN


main : Program () Model Msg
main =
    Browser.element
        { init = init
        , update = update
        , subscriptions = \_ -> Sub.none
        , view = view
        }



-- MODEL


type alias Product =
    { id : String
    , name : String
    , price : Float
    , imageSrc : String
    , colors : List ColorOption
    }


type alias RelatedProduct =
    { id : String
    , name : String
    , price : Float
    , imageSrc : String
    , colors : List ColorOption
    }


type alias ColorOption =
    { name : String
    , value : String
    }


type alias Model =
    { product : Maybe Product
    , relatedProducts : List RelatedProduct
    , error : Maybe String
    , selectedColor : Maybe ColorOption
    , loading : Bool
    }


init : () -> ( Model, Cmd Msg )
init _ =
    ( { product = Nothing
      , relatedProducts = []
      , error = Nothing
      , selectedColor = Nothing
      , loading = True
      }
    , fetchProduct
    )



-- UPDATE


type Msg
    = ProductLoaded (Result Http.Error (Product, List RelatedProduct))
    | SelectColor ColorOption
    | AddToCart


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ProductLoaded result ->
            case result of
                Ok (product, relatedProducts) ->
                    ( { model 
                      | product = Just product
                      , relatedProducts = relatedProducts
                      , selectedColor = List.head product.colors
                      , loading = False 
                      }
                    , Cmd.none
                    )

                Err _ ->
                    ( { model 
                      | error = Just "Failed to load product"
                      , loading = False 
                      }
                    , Cmd.none
                    )

        SelectColor color ->
            ( { model | selectedColor = Just color }, Cmd.none )

        AddToCart ->
            -- In a real app, we would send an API request to add the product to cart
            ( model, Cmd.none )



-- HTTP


fetchProduct : Cmd Msg
fetchProduct =
    -- Simulating API call - in real app would be a real endpoint
    Http.get
        { url = "/api/product.json"
        , expect = Http.expectJson ProductLoaded productWithRelatedDecoder
        }


productWithRelatedDecoder : Decoder (Product, List RelatedProduct)
productWithRelatedDecoder =
    Decode.map2 Tuple.pair
        productDecoder
        (Decode.field "relatedProducts" (Decode.list relatedProductDecoder))


productDecoder : Decoder Product
productDecoder =
    Decode.map5 Product
        (field "id" string)
        (field "name" string)
        (field "price" float)
        (field "imageSrc" string)
        (field "colors" (Decode.list colorDecoder))


relatedProductDecoder : Decoder RelatedProduct
relatedProductDecoder =
    Decode.map5 RelatedProduct
        (field "id" string)
        (field "name" string)
        (field "price" float)
        (field "imageSrc" string)
        (field "colors" (Decode.list colorDecoder))


colorDecoder : Decoder ColorOption
colorDecoder =
    Decode.map2 ColorOption
        (field "name" string)
        (field "value" string)



-- VIEW


view : Model -> Html Msg
view model =
    div [ class "product-card" ]
        [ viewProduct model
        , viewRelatedProducts model.relatedProducts
        ]


viewProduct : Model -> Html Msg
viewProduct model =
    if model.loading then
        div [ class "product-card__loading" ] [ text "Loading..." ]
    
    else
        case model.product of
            Nothing ->
                div [ class "product-card__error" ] 
                    [ text (Maybe.withDefault "Error loading product" model.error) ]

            Just product ->
                div [ class "product-card__container" ]
                    [ div [ class "product-card__image-container" ]
                        [ img 
                            [ src product.imageSrc
                            , alt product.name
                            , class "product-card__image"
                            ] 
                            []
                        ]
                    , div [ class "product-card__info" ]
                        [ h2 [ class "product-card__title" ] [ text product.name ]
                        , p [ class "product-card__price" ] [ text ("$" ++ String.fromFloat product.price) ]
                        , div [ class "product-card__colors" ]
                            [ p [ class "product-card__colors-label" ] [ text "Colors:" ]
                            , div [ class "product-card__color-options" ] 
                                (List.map (viewColorOption model.selectedColor) product.colors)
                            ]
                        , button 
                            [ class "product-card__add-to-cart"
                            , onClick AddToCart
                            ] 
                            [ text "Add to Cart" ]
                        ]
                    ]


viewColorOption : Maybe ColorOption -> ColorOption -> Html Msg
viewColorOption selectedColor color =
    let
        isSelected =
            case selectedColor of
                Just selected ->
                    selected.value == color.value
                
                Nothing ->
                    False
        
        selectionClass =
            if isSelected then
                " product-card__color-option--selected"
            else
                ""
    in
    div 
        [ class ("product-card__color-option" ++ selectionClass)
        , style "background-color" color.value
        , onClick (SelectColor color)
        , title color.name
        ] 
        []


viewRelatedProducts : List RelatedProduct -> Html Msg
viewRelatedProducts relatedProducts =
    if List.isEmpty relatedProducts then
        div [] []
    else
        div [ class "product-card__related" ]
            [ h3 [ class "product-card__related-title" ] [ text "You may also like" ]
            , div [ class "product-card__related-products" ]
                (List.map viewRelatedProduct relatedProducts)
            ]


viewRelatedProduct : RelatedProduct -> Html Msg
viewRelatedProduct product =
    div [ class "product-card__related-item" ]
        [ div [ class "product-card__related-image-container" ]
            [ img 
                [ src product.imageSrc
                , alt product.name
                , class "product-card__related-image"
                ] 
                []
            ]
        , div [ class "product-card__related-info" ]
            [ h4 [ class "product-card__related-name" ] [ text product.name ]
            , p [ class "product-card__related-price" ] [ text ("$" ++ String.fromFloat product.price) ]
            ]
        ] 
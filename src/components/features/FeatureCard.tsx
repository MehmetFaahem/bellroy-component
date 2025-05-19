import React from "react";
import { FeatureCardProps } from "./types";

export const FeatureCard: React.FC<FeatureCardProps> = ({
  imageUrl,
  imageAlt,
  title,
  description,
  ctaText,
}) => {
  return (
    <article className="w-[283px] flex flex-col items-center text-center p-3.5 max-md:w-[45%] max-md:min-w-[250px] max-sm:w-full max-sm:max-w-none">
      <div className="w-[154px] h-[154px] overflow-hidden mb-3.5 rounded-[50%]">
        <img
          src={imageUrl}
          alt={imageAlt}
          className="w-full h-full object-cover"
        />
      </div>
      <h3 className="text-[21px] font-normal leading-7 text-[#333] mb-3.5">
        {title}
      </h3>
      <p className="text-[13px] font-normal leading-[21px] tracking-[0.325px] text-[#333] mb-[42px]">
        {description}
      </p>
      <div
        className="text-[13px] font-bold leading-[21px] tracking-[1.95px] uppercase text-[#E15A1D] cursor-pointer"
        role="button"
        tabIndex={0}
      >
        {ctaText.split("&amp;gt;").join(">")}
      </div>
    </article>
  );
};

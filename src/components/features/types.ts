export interface FeatureCardProps {
  imageUrl: string;
  imageAlt: string;
  title: string;
  description: string;
  ctaText: string;
}

export interface FeatureGridProps {
  features: FeatureCardProps[];
}

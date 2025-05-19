import React from "react";
import { FeatureCard } from "./FeatureCard";
import { FeatureGridProps } from "./types";

export const FeatureGrid: React.FC<FeatureGridProps> = ({ features }) => {
  return (
    <section className="max-w-[1202px] flex justify-center items-start gap-3.5 flex-wrap mx-auto my-0 px-0 py-7 max-md:max-w-[991px] max-md:px-5 max-md:py-7 max-sm:max-w-screen-sm max-sm:px-3.5 max-sm:py-7">
      {features.map((feature, index) => (
        <FeatureCard key={index} {...feature} />
      ))}
    </section>
  );
};

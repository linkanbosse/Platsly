import { createElement } from "react";
import { categoryShapes } from "./categoryShapes";

function shapesFor(category: string) {
  return Object.prototype.hasOwnProperty.call(categoryShapes, category)
    ? categoryShapes[category]!
    : categoryShapes["default"]!;
}

export function CategoryIcon({ category, className = "size-5" }: { category: string; className?: string }) {
  return <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth={1.8} strokeLinecap="round" strokeLinejoin="round" className={className} aria-hidden="true">
    {shapesFor(category).map(([tag, attributes], index) => createElement(tag, { ...attributes, key: index }))}
  </svg>;
}

// Leaflet accepts DOM nodes; no React root or server renderer is needed for markers.
export function createMapLocationIcon(category: string, discovered: boolean): HTMLDivElement {
  const wrapper = document.createElement("div");
  wrapper.className = `pl-loc${discovered ? " pl-loc-found" : ""}`;
  const svg = document.createElementNS("http://www.w3.org/2000/svg", "svg");
  const attributes = { width: "24", height: "24", viewBox: "0 0 24 24", fill: "none", stroke: "currentColor", "stroke-width": discovered ? "2" : "1.8", "stroke-linecap": "round", "stroke-linejoin": "round", "aria-hidden": "true" };
  for (const [name, value] of Object.entries(attributes)) svg.setAttribute(name, value);
  for (const [tag, attributes] of shapesFor(discovered ? "discovered" : category)) {
    const shape = document.createElementNS("http://www.w3.org/2000/svg", tag);
    for (const [name, value] of Object.entries(attributes)) shape.setAttribute(name, value);
    svg.appendChild(shape);
  }
  wrapper.appendChild(svg);
  return wrapper;
}
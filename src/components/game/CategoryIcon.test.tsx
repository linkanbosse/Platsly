import { describe, expect, it } from "vitest";
import { render } from "@testing-library/react";
import { CategoryIcon, createMapLocationIcon } from "./CategoryIcon";
import { categoryShapes } from "./categoryShapes";

describe("location icons", () => {
  it("uses identical SVG geometry in lists and Leaflet without a server renderer", () => {
    for (const category of Object.keys(categoryShapes)) {
      const { container, unmount } = render(<CategoryIcon category={category} />);
      const marker = createMapLocationIcon(category, false);
      expect(marker.querySelector("svg")?.innerHTML).toBe(container.querySelector("svg")?.innerHTML);
      unmount();
    }
  });
  it("marks discovered places and safely falls back for unknown categories", () => {
    expect(createMapLocationIcon("butik", true).classList.contains("pl-loc-found")).toBe(true);
    expect(createMapLocationIcon("unknown", false).innerHTML).toBe(createMapLocationIcon("default", false).innerHTML);
    expect(createMapLocationIcon("__proto__", false).innerHTML).toBe(createMapLocationIcon("default", false).innerHTML);
  });
});
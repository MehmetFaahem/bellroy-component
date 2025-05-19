# Bellroy Product Card Component Recreation

This project recreates a product card component from Bellroy.com using Elm and Astro. The component includes:

- Product image display
- Title and price information
- Color selection options
- Add to cart button
- Responsive design
- Data fetching from a simulated API endpoint

## Features

- **Elm for Component Logic**: The core product card functionality is built in Elm, providing type safety and predictable state management.
- **Astro for Integration**: Wraps the Elm component in an Astro component for easy integration with a full website.
- **Responsive Design**: Works well on both desktop and mobile devices.
- **Maintainable CSS**: Uses CSS variables and BEM methodology for maintainable styling.
- **External Data Fetching**: Simulates fetching product data from an API endpoint.

## Project Structure

- `src/elm/ProductCard/` - Elm source code for the product card component
- `src/components/` - Astro components including the ProductCard wrapper
- `src/styles/` - CSS styles for the component
- `public/api/` - Mock API responses
- `public/images/` - Product images

## Technology Stack

- Elm 0.19
- Astro
- CSS (with variables and BEM methodology)

## Getting Started

1. **Install dependencies**:
   ```bash
   npm install
   ```

2. **Run the development server**:
   ```bash
   npm run dev
   ```

3. **Build for production**:
   ```bash
   npm run build
   ```

## Design Decisions

- **BEM Methodology**: Used BEM (Block, Element, Modifier) naming convention for CSS to ensure styles are maintainable and modular.
- **CSS Variables**: Used CSS variables for colors, spacing, and typography to maintain consistency and make theme changes easier.
- **The Elm Architecture**: Leveraged Elm's Model-View-Update pattern for predictable state management.
- **Responsive Design**: Mobile-first approach with media queries for larger screens.
- **Error Handling**: Graceful handling of loading states and potential errors when fetching product data.

## Areas for Improvement

- Add unit tests for the Elm component
- Implement additional interactive features like image galleries
- Add animation for color selection
- Integrate with a real backend API

```sh
npm create astro@latest -- --template basics
```

[![Open in StackBlitz](https://developer.stackblitz.com/img/open_in_stackblitz.svg)](https://stackblitz.com/github/withastro/astro/tree/latest/examples/basics)
[![Open with CodeSandbox](https://assets.codesandbox.io/github/button-edit-lime.svg)](https://codesandbox.io/p/sandbox/github/withastro/astro/tree/latest/examples/basics)
[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/withastro/astro?devcontainer_path=.devcontainer/basics/devcontainer.json)

> 🧑‍🚀 **Seasoned astronaut?** Delete this file. Have fun!

![just-the-basics](https://github.com/withastro/astro/assets/2244813/a0a5533c-a856-4198-8470-2d67b1d7c554)

## 🚀 Project Structure

Inside of your Astro project, you'll see the following folders and files:

```text
/
├── public/
│   └── favicon.svg
├── src/
│   ├── layouts/
│   │   └── Layout.astro
│   └── pages/
│       └── index.astro
└── package.json
```

To learn more about the folder structure of an Astro project, refer to [our guide on project structure](https://docs.astro.build/en/basics/project-structure/).

## 🧞 Commands

All commands are run from the root of the project, from a terminal:

| Command                   | Action                                           |
| :------------------------ | :----------------------------------------------- |
| `npm install`             | Installs dependencies                            |
| `npm run dev`             | Starts local dev server at `localhost:4321`      |
| `npm run build`           | Build your production site to `./dist/`          |
| `npm run preview`         | Preview your build locally, before deploying     |
| `npm run astro ...`       | Run CLI commands like `astro add`, `astro check` |
| `npm run astro -- --help` | Get help using the Astro CLI                     |

## 👀 Want to learn more?

Feel free to check [our documentation](https://docs.astro.build) or jump into our [Discord server](https://astro.build/chat).

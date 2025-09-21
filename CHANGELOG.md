# CHANGELOG

## 1.0.0 (2025-09-21)

*   **Significant Refactoring**: Replaced Railroady-based graph generation with AST parsing using the 'parser' gem.
    *   Removed 'railroady' gem dependency.
    *   Introduced `Solidarity::AstProcessor` for Ruby file parsing.
    *   Updated `Solidarity::RailRoadyRunner` to use AST-based graph generation.
    *   Refactored `Solidarity::Graph` to initialize directly from AST data.
*   **Dependency Updates**: Added 'parser' gem as a runtime dependency.
*   **Gemspec Fixes**: Corrected invalid HTTP URI placeholders in gemspec metadata.

## 0.1.0 (Initial Release)

*   Initial gem structure and basic SOLID principle evaluation using Railroady.

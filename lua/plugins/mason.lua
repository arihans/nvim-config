-----------------------------------------------------------
-- LSP package manager configuration file
-----------------------------------------------------------

-- Plugin: mason.nvim
-- url: https://github.com/williamboman/mason.nvim

local status_ok, mason = pcall(require, 'mason')
if not status_ok then
  return
end

mason.setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})


-----------------------------------------------------------

-- Maps lspconfig server config name to its corresponding package name.
_G.mason_lspconfig_to_package = {
    ["als"] = "ada-language-server",
    ["angularls"] = "angular-language-server",
    ["ansiblels"] = "ansible-language-server",
    ["apex_ls"] = "apex-language-server",
    ["arduino_language_server"] = "arduino-language-server",
    ["asm_lsp"] = "asm-lsp",
    ["astro"] = "astro-language-server",
    ["awk_ls"] = "awk-language-server",
    ["bashls"] = "bash-language-server",
    ["beancount"] = "beancount-language-server",
    ["bicep"] = "bicep-lsp",
    ["bsl_ls"] = "bsl-language-server",
    ["bufls"] = "buf-language-server",
    ["clangd"] = "clangd",
    ["clarity_lsp"] = "clarity-lsp",
    ["clojure_lsp"] = "clojure-lsp",
    ["cmake"] = "cmake-language-server",
    ["codeqlls"] = "codeql",
    ["crystalline"] = "crystalline",
    ["csharp_ls"] = "csharp-language-server",
    ["cssls"] = "css-lsp",
    ["cssmodules_ls"] = "cssmodules-language-server",
    ["cucumber_language_server"] = "cucumber-language-server",
    ["dagger"] = "cuelsp",
    ["denols"] = "deno",
    ["dhall_lsp_server"] = "dhall-lsp",
    ["diagnosticls"] = "diagnostic-languageserver",
    ["dockerls"] = "dockerfile-language-server",
    ["dotls"] = "dot-language-server",
    ["efm"] = "efm",
    ["elixirls"] = "elixir-ls",
    ["elmls"] = "elm-language-server",
    ["ember"] = "ember-language-server",
    ["emmet_ls"] = "emmet-ls",
    ["erg_language_server"] = "erg-language-server",
    ["erlangls"] = "erlang-ls",
    ["esbonio"] = "esbonio",
    ["eslint"] = "eslint-lsp",
    ["flux_lsp"] = "flux-lsp",
    ["foam_ls"] = "foam-language-server",
    ["fortls"] = "fortls",
    ["fsautocomplete"] = "fsautocomplete",
    ["glint"] = "glint",
    ["golangci_lint_ls"] = "golangci-lint-langserver",
    ["gopls"] = "gopls",
    ["gradle_ls"] = "gradle-language-server",
    ["grammarly"] = "grammarly-languageserver",
    ["graphql"] = "graphql-language-service-cli",
    ["groovyls"] = "groovy-language-server",
    ["haxe_language_server"] = "haxe-language-server",
    ["hls"] = "haskell-language-server",
    ["hoon_ls"] = "hoon-language-server",
    ["html"] = "html-lsp",
    ["intelephense"] = "intelephense",
    ["jdtls"] = "jdtls",
    ["jedi_language_server"] = "jedi-language-server",
    ["jsonls"] = "json-lsp",
    ["jsonnet_ls"] = "jsonnet-language-server",
    ["julials"] = "julia-lsp",
    ["kotlin_language_server"] = "kotlin-language-server",
    ["lelwel_ls"] = "lelwel",
    ["lemminx"] = "lemminx",
    ["ltex"] = "ltex-ls",
    ["lua_ls"] = "lua-language-server",
    ["luau_lsp"] = "luau-lsp",
    ["marksman"] = "marksman",
    ["mm0_ls"] = "metamath-zero-lsp",
    ["nickel_ls"] = "nickel-lang-lsp",
    ["nimls"] = "nimlsp",
    ["ocamllsp"] = "ocaml-lsp",
    ["omnisharp"] = "omnisharp",
    ["omnisharp_mono"] = "omnisharp-mono",
    ["opencl_ls"] = "opencl-language-server",
    ["perlnavigator"] = "perlnavigator",
    ["phpactor"] = "phpactor",
    ["powershell_es"] = "powershell-editor-services",
    ["prismals"] = "prisma-language-server",
    ["prosemd_lsp"] = "prosemd-lsp",
    ["psalm"] = "psalm",
    ["puppet"] = "puppet-editor-services",
    ["purescriptls"] = "purescript-language-server",
    ["pylsp"] = "python-lsp-server",
    ["pyright"] = "pyright",
    ["quick_lint_js"] = "quick-lint-js",
    ["r_language_server"] = "r-languageserver",
    ["reason_ls"] = "reason-language-server",
    ["remark_ls"] = "remark-language-server",
    ["rescriptls"] = "rescript-lsp",
    ["rnix"] = "rnix-lsp",
    ["robotframework_ls"] = "robotframework-lsp",
    ["rome"] = "rome",
    ["ruby_ls"] = "ruby-lsp",
    ["rust_analyzer"] = "rust-analyzer",
    ["salt_ls"] = "salt-lsp",
    ["serve_d"] = "serve-d",
    ["slint_lsp"] = "slint-lsp",
    ["solang"] = "solang",
    ["solargraph"] = "solargraph",
    ["solc"] = "solidity",
    ["solidity"] = "solidity-ls",
    ["sorbet"] = "sorbet",
    ["sourcery"] = "sourcery",
    ["sqlls"] = "sqlls",
    ["sqls"] = "sqls",
    ["stylelint_lsp"] = "stylelint-lsp",
    ["sumneko_lua"] = "lua-language-server",
    ["svelte"] = "svelte-language-server",
    ["svlangserver"] = "svlangserver",
    ["svls"] = "svls",
    ["tailwindcss"] = "tailwindcss-language-server",
    ["taplo"] = "taplo",
    ["teal_ls"] = "teal-language-server",
    ["terraformls"] = "terraform-ls",
    ["texlab"] = "texlab",
    ["tflint"] = "tflint",
    ["theme_check"] = "shopify-theme-check",
    ["ts_ls"] = "typescript-language-server",
    ["vala_ls"] = "vala-language-server",
    ["verible"] = "verible",
    ["vimls"] = "vim-language-server",
    ["visualforce_ls"] = "visualforce-language-server",
    ["vls"] = "vls",
    ["volar"] = "vue-language-server",
    ["vuels"] = "vetur-vls",
    ["wgsl_analyzer"] = "wgsl-analyzer",
    ["yamlls"] = "yaml-language-server",
    ["zk"] = "zk",
    ["zls"] = "zls",
}

_G.mason_package_to_lspconfig = require 'mason-core.functional'.invert(mason_lspconfig_to_package)

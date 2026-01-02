local M = {}

-- hls is a map of UI specific highlights used
-- by the litee.nvim library.
M.hls = {
    SymbolDetailHL = "LTSymbolDetail",
    SymbolHL = "LTSymbol",
    SymbolJumpHL = "LTSymbolJump",
    SymbolJumpRefsHL = "LTSymbolJumpRefs",
    IndentGuideHL = "LTIndentGuide",
    ExpandedGuideHL = "LTExpandedGuide",
    CollapsedGuideHL = "LTCollapsedGuide",
    SelectFiletreeHL = "LTSelectFiletree",
    NormalSB = "LTNormalSB",
    SymbolNameColor0 = "LTSymbolNameColor0",
    SymbolNameColor1 = "LTSymbolNameColor1",
    SymbolNameColor2 = "LTSymbolNameColor2",
    SymbolNameColor3 = "LTSymbolNameColor3",
    SymbolNameColor4 = "LTSymbolNameColor4",
    SymbolNameColor5 = "LTSymbolNameColor5",
}

-- setup_default_highlights configures a list of default
-- highlights for the litee.nvim library.
function M.setup_default_highlights()
    local dark = {
        LTBoolean = "hi LTBoolean                guifg=#0087af guibg=None",
        LTConstant = "hi LTConstant               guifg=#0087af guibg=None",
        LTConstructor = "hi LTConstructor            guifg=#4DC5C6 guibg=None",
        LTField = "hi LTField                  guifg=#0087af guibg=None",
        LTFunction = "hi LTFunction               guifg=#988ACF guibg=None",
        LTMethod = "hi LTMethod                 guifg=#0087af guibg=None",
        LTNamespace = "hi LTNamespace              guifg=#87af87 guibg=None",
        LTNumber = "hi LTNumber                 guifg=#9b885c guibg=None",
        LTOperator = "hi LTOperator               guifg=#988ACF guibg=None",
        LTParameter = "hi LTParameter              guifg=#988ACF guibg=None",
        LTParameterReference = "hi LTParameterReference     guifg=#4DC5C6 guibg=None",
        LTString = "hi LTString                 guifg=#af5f5f guibg=None",
        LTSymbol = "hi LTSymbol                 guifg=#87afd7 ",
        LTSymbolDetail = "hi LTSymbolDetail           ctermfg=024 cterm=italic guifg=#988ACF gui=italic",
        LTSymbolJump = "hi LTSymbolJump             ctermfg=015 ctermbg=110 cterm=italic,bold,underline   guifg=#464646 guibg=#87afd7 gui=italic,bold",
        LTSymbolJumpRefs = "hi LTSymbolJumpRefs         ctermfg=015 ctermbg=110 cterm=italic,bold,underline   guifg=#464646 guibg=#9b885c gui=italic,bold",
        LTType = "hi LTType                   guifg=#9b885c guibg=None",
        LTURI = "hi LTURI                    guifg=#988ACF guibg=None",
        LTIndentGuide = "hi LTIndentGuide            guifg=None    guibg=None",
        LTExpandedGuide = "hi LTExpandedGuide          guifg=None    guibg=None",
        LTCollapsedGuide = "hi LTCollapsedGuide         guifg=None    guibg=None",
        LTSelectFiletree = "hi LTSelectFiletree ctermbg=131  ctermfg=246 cterm=None guibg=#af5f5f guifg=#e4e4e4 gui=None",
        LTSymbolNameColor0 = "hi LTSymbolNameColor0      guifg=#8CCBEA guibg=None",
        LTSymbolNameColor1 = "hi LTSymbolNameColor1      guifg=#A4E57E guibg=None",
        LTSymbolNameColor2 = "hi LTSymbolNameColor2      guifg=#FFDB72 guibg=None",
        LTSymbolNameColor3 = "hi LTSymbolNameColor3      guifg=#FF7272 guibg=None",
        LTSymbolNameColor4 = "hi LTSymbolNameColor4      guifg=#FFB3FF guibg=None",
        LTSymbolNameColor5 = "hi LTSymbolNameColor5      guifg=#9999FF guibg=None",
    }
    for hl_name, hl in pairs(dark) do
        if vim.fn.hlexists(hl_name) == 0 then
            vim.cmd(hl)
        end
    end
end

return M

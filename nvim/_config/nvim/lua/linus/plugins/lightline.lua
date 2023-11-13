return(
  { "itchyny/lightline.vim", name = "lightline",
    dependencies = { "airblade/vim-gitgutter" },
    config = function()
      vim.g.lightline = { 
        colorscheme = "catppuccin",
        active = {
          left =  {
            { 'mode', 'paste' },
            { 'readonly', 'filename', 'git_status', 'modified' }
          }
        },
        component_function =  {
          git_status = 'LightlineGitStatus'
        }
      }

      -- Define a vim function for the git_status component.
      vim.cmd([[
        function! LightlineGitStatus()
          let [a,m,r] = GitGutterGetHunkSummary()
          if (a + m + r) == 0
            return ""
          endif
          return printf('+%d ~%d -%d ', a, m, r)
        endfunction
      ]])
    end
  }
)

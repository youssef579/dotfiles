return {
  'xeluxee/competitest.nvim',
  dependencies = 'MunifTanjim/nui.nvim',
  keys = {
    { '<leader>cc', '<cmd>CompetiTest receive contest<CR>', desc = '[C]ompetiTest [C]ontest' },
    { '<leader>cp', '<cmd>CompetiTest receive problem<CR>', desc = '[C]ompetiTest [P]roblem' },
    { '<leader>ca', '<cmd>CompetiTest add_testcase<CR>', desc = '[C]ompetiTest [A]dd Testcase' },
    { '<leader>ce', '<cmd>CompetiTest edit_testcase<CR>', desc = '[C]ompetiTest [E]dit Testcase' },
    { '<leader>cr', '<cmd>CompetiTest run<CR>', desc = '[C]ompetiTest [R]un' },
    { '<leader>cd', '<cmd>CompetiTest delete_testcase<CR>', desc = '[C]ompetiTest [D]elete Testcase' },
  },
  config = function()
    require('competitest').setup {
      received_problems_path = '$(HOME)/Programming/cp/$(JUDGE)/$(CONTEST)/$(PROBLEM)/main.$(FEXT)',
      received_contests_directory = '$(HOME)/Programming/cp/$(JUDGE)/$(CONTEST)',
      received_contests_problems_path = '$(PROBLEM)/main.$(FEXT)',
      open_received_contests = false,
      received_contests_prompt_extension = false,
      received_contests_prompt_directory = false,
      received_problems_prompt_path = false,
      evaluate_template_modifiers = true,
      testcases_use_single_file = true,
      view_output_diff = true,
      template_file = '~/.config/nvim/templates/template.$(FEXT)',
    }
  end,
}

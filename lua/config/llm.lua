local llm = require('llm')

llm.setup({
  api_token = nil, -- cf Install paragraph
  model = "Qwen2.5-Coder-32B-Instruct-exl2", -- the model ID, behavior depends on backendllm
  backend = "openai", -- backend ID, "huggingface" | "ollama" | "openai" | "tgi"
  url = "http://localhost:5555", -- the http url of the backend
  -- parameters that are added to the request body, values are arbitrary, you can set any field:value pair here it will be passed as is to the backend
  request_body = {
      max_tokens = 50,
      -- max_new_tokens = 80,
      -- temperature = 0.2,
      -- top_p = 0.95,
  },

  -- tokens_to_clear = { "<｜end▁of▁sentence｜>" }, -- tokens to remove from the model's output
  -- set this if the model supports fill in the middle
  -- fim = {
  --   enabled = true,
  --   prefix = "<｜fim▁begin｜>",
  --   suffix = "<｜fim▁hole｜>",
  --   middle = "<｜fim▁end｜>",
  -- },

  tokens_to_clear = { "<|file_sep|>" },
  fim = {
    enabled = true,
    prefix = "<|fim_prefix|>",
    middle = "<|fim_middle|>",
    suffix = "<|fim_suffix|>",
  },
  tokenizer = nil,

  debounce_ms = 150,

  accept_keymap = "<C-f>",
  dismiss_keymap = "<C-Tab>",
  tls_skip_verify_insecure = false,
  -- llm-ls configuration, cf llm-ls section
  lsp = {
    bin_path = nil,
    host = nil,
    port = nil,
    cmd_env = nil, -- or { LLM_LOG_LEVEL = "DEBUG" } to set the log level of llm-ls
    version = "0.5.3",
  },
  context_window = 32000, -- max number of tokens for the context window
  enable_suggestions_on_startup = false,
  eneable_suggestions_on_files = "*", -- pattern matching syntax to enable suggestions on specific files, either a string or a list of strings
  disable_url_path_completion = false, -- cf Backend
})


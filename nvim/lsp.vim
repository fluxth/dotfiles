set completeopt=menuone,noinsert,noselect

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

" Configure the completion chains
let g:completion_chain_complete_list = {
			\'default' : {
			\	'default' : [
			\		{'complete_items' : ['lsp', 'snippet']},
			\		{'mode' : 'file'}
			\	],
			\	'comment' : [],
			\	'string' : []
			\	},
			\'vim' : [
			\	{'complete_items': ['snippet']},
			\	{'mode' : 'cmd'}
			\	],
			\'cpp' : [
			\	{'complete_items': ['ts']}
			\	],
			\'rust' : [
			\	{'complete_items': ['ts']}
			\	],
			\'python' : [
			\	{'complete_items': ['ts']}
			\	],
			\}

lua require'lspconfig'.tsserver.setup{ on_attach=require'completion'.on_attach  }
lua require'lspconfig'.clangd.setup{ on_attach=require'completion'.on_attach }
lua require'lspconfig'.pyls.setup{ on_attach=require'completion'.on_attach }
lua require'lspconfig'.rust_analyzer.setup{ on_attach=require'completion'.on_attach; settings={rust_analyzer={inlayHints={enable=true;typeHints=true}}} }

autocmd BufEnter * lua require'completion'.on_attach()

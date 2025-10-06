return {
	on_init = function ()
		require("csharpls_extended").buf_read_cmd_bind()
		require("telescope").load_extension("csharpls_definition")
	end
}

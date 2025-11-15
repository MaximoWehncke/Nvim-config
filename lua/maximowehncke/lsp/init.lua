-- Load all server configurations from the servers directory
local M = {}

M.servers = {
	lua_ls = require("maximowehncke.lsp.servers.lua_ls"),
	clangd = require("maximowehncke.lsp.servers.clangd"),
	jdtls = require("maximowehncke.lsp.servers.jdtls"),
}

return M

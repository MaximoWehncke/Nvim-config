return {
    on_attach = function(client)
        client.server_capabilities.documentFormattingProvider = false
    end,
    settings = {
        sqls = {
            connections = {
                {
                    driver = "postgresql",
                    dataSourceName = "host=127.0.0.1 port=5432 user=postgres password=postgres dbname=moneytrackker-db sslmode=disable",
                },
            },
        },
    },
}

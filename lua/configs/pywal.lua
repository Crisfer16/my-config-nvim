-- configuracion esquema de colores pywal

local ok, wal = pcall(require, "wal")
if not ok then
   return
end

-- aplicamos los cambios del esquema de colores
wal.setup()

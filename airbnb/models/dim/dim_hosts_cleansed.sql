{{ config(materialized='view') }}
WITH src_hosts AS (
    -- Usamos la función ref() de dbt para referenciar el modelo anterior
    SELECT * FROM {{ ref('src_hosts') }}
)

SELECT
    host_id,
    -- NVL evalúa si host_name es nulo. Si lo es, pone 'Anonymous'. Si no, lo deja igual.
    NVL(host_name, 'Anonymous') AS host_name,
    is_superhost,
    created_at,
    updated_at
FROM
    src_hosts
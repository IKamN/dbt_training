{% macro concat_name(first_name , last_name) -%}
    concat(last_name, ' ', first_name)
{%- endmacro %}
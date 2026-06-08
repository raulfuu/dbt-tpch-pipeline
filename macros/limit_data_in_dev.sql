{% macro limit_data_in_dev(limit_rows=1000) %}
    {% if target.name == 'dev' %}
        limit {{ limit_rows }}
    {% endif %}
{% endmacro %}
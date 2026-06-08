{% macro calc_net_amount(extended_price, discount, tax) %}
    ({{ extended_price }} * (1 - {{ discount }}) * (1 + {{ tax }}))
{% endmacro %}
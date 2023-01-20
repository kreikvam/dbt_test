select
    id as payment_id,
    orderid as order_id,
    PAYMENTMETHOD as payment_method,
    status,

    --- amount is stored in cents, convert it to dollars
   ----- amount /100 as amount,    byttes ut med makro bare for trening, mindre lesbart
        -- amount is stored in cents, convert it to dollars
    {{ cents_to_dollars('amount', 4) }} as amount,
    created as created_at  

from {{ source('stripe', 'stripe_payments') }}


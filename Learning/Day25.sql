
SELECT p.party_id,
       p.party_type_id,
       p.EXTERNAL_ID,
       pc.PARTY_CLASSIFICATION_GROUP_ID,
       pct.PARTY_CLASSIFICATION_TYPE_ID
FROM PARTY p
         JOIN party_classification pc ON p.party_id = pc.party_id
         JOIN party_classification_group pcg ON pc.party_classification_group_id = pcg.party_classification_group_id
         JOIN PARTY_CLASSIFICATION_TYPE pct ON pcg.PARTY_CLASSIFICATION_TYPE_ID = pct.PARTY_CLASSIFICATION_TYPE_ID
WHERE pct.PARTY_CLASSIFICATION_TYPE_ID = "TRADE_RETAIL_CLASSIF";

select * from PARTY_CLASSIFICATION_TYPE where PARTY_CLASSIFICATION_TYPE_ID like "%RETAIL%";

SELECT *
FROM shipment s
         JOIN order_header oh ON s.primary_order_id = oh.ORDER_ID;


SELECT *
FROM order_header oh
         JOIN order_type ot ON oh.ORDER_TYPE_ID = ot.ORDER_TYPE_ID;
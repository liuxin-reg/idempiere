DROP VIEW m_inout_line_vt;

CREATE OR REPLACE VIEW m_inout_line_vt
AS
  SELECT iol.ad_client_id,
         iol.ad_org_id,
         iol.isactive,
         iol.created,
         iol.createdby,
         iol.updated,
         iol.updatedby,
         uomt.ad_language,
         iol.m_inout_id,
         iol.m_inoutline_id,
         iol.line,
         pt.m_product_id,
         CASE
           WHEN iol.movementqty <> 0
                 OR iol.m_product_id IS NOT NULL THEN iol.movementqty
           ELSE NULL
         END                                                                                    AS movementqty,
         CASE
           WHEN iol.qtyentered <> 0
                 OR iol.m_product_id IS NOT NULL THEN iol.qtyentered
           ELSE NULL
         END                                                                                    AS qtyentered,
         CASE
           WHEN iol.movementqty <> 0
                 OR iol.m_product_id IS NOT NULL THEN uomt.uomsymbol
           ELSE NULL
         END                                                                                    AS uomsymbol,
         ol.qtyordered,
         ol.qtydelivered,
         CASE
           WHEN iol.movementqty <> 0
                 OR iol.m_product_id IS NOT NULL THEN ol.qtyordered - ol.qtydelivered
           ELSE NULL
         END                                                                                    AS qtybackordered,
         COALESCE(pt.name
                  || productattribute(iol.m_attributesetinstance_id), ct.name, iol.description) AS name,
         CASE
           WHEN COALESCE(ct.name, pt.name) IS NOT NULL THEN iol.description
           ELSE NULL
         END                                                                                    AS description,
         pt.documentnote,
         p.upc,
         p.sku,
         p.value                                                                                AS productvalue,
         iol.m_locator_id,
         l.m_warehouse_id,
         l.x,
         l.y,
         l.z,
         iol.m_attributesetinstance_id,
         asi.m_attributeset_id,
         asi.serno,
         asi.lot,
         asi.m_lot_id,
         asi.guaranteedate,
         pt.description                                                                         AS productdescription,
         p.imageurl,
         iol.c_campaign_id,
         iol.c_project_id,
         iol.c_activity_id,
         iol.c_projectphase_id,
         iol.c_projecttask_id,
         iol.ad_orgtrx_id,
         iol.c_charge_id,
         iol.confirmedqty,
         iol.c_orderline_id,
         iol.c_uom_id                                                                           AS m_inoutline_c_uom_id,
         iol.isdescription                                                                      AS m_inoutline_isdescription,
         iol.isinvoiced,
         iol.m_rmaline_id,
         iol.pickedqty,
         iol.processed                                                                          AS m_inoutline_processed,
         iol.ref_inoutline_id,
         iol.reversalline_id,
         iol.scrappedqty,
         iol.targetqty,
         iol.user1_id                                                                           AS m_inoutline_user1_id,
         iol.user2_id                                                                           AS m_inoutline_user2_id,
         pt.ad_org_id                                                                           AS m_product_ad_org_id,
         p.classification,
         p.copyfrom                                                                             AS m_product_copyfrom,
         pt.created                                                                             AS m_product_created,
         pt.createdby                                                                           AS m_product_createdby,
         p.c_revenuerecognition_id,
         p.c_subscriptiontype_id,
         p.c_taxcategory_id                                                                     AS m_product_c_taxcategory_id,
         p.c_uom_id                                                                             AS m_product_c_uom_id,
         p.descriptionurl,
         p.discontinued,
         p.discontinuedat,
         p.group1,
         p.group2,
         p.guaranteedays,
         p.guaranteedaysmin,
         p.help,
         pt.isactive                                                                            AS m_product_isactive,
         p.isbom,
         p.isdropship,
         p.isexcludeautodelivery,
         p.isinvoiceprintdetails,
         p.ispicklistprintdetails,
         p.ispurchased,
         p.isselfservice                                                                        AS m_product_isselfservice,
         p.issold,
         p.isstocked,
         p.issummary                                                                            AS m_product_issummary,
         p.isverified,
         p.iswebstorefeatured,
         p.lowlevel,
         p.m_attributeset_id                                                                    AS m_product_m_attributeset_id,
         p.m_attributesetinstance_id                                                            AS m_product_m_asi_id,
         p.m_freightcategory_id,
         p.m_locator_id                                                                         AS m_product_m_locator_id,
         p.m_product_category_id                                                                AS m_product_m_prod_category_id,
         p.processing                                                                           AS m_product_processing,
         p.producttype,
         p.r_mailtext_id,
         p.salesrep_id                                                                          AS m_product_salesrep_id,
         p.s_expensetype_id,
         p.shelfdepth,
         p.shelfheight,
         p.shelfwidth,
         p.s_resource_id                                                                        AS m_product_s_resource_id,
         p.unitsperpack,
         p.unitsperpallet,
         p.updated                                                                              AS m_product_updated,
         p.updatedby                                                                            AS m_product_updatedby,
         p.versionno,
         p.volume,
         p.weight,
         uomt.ad_org_id                                                                         AS c_uom_ad_org_id,
         uom.costingprecision,
         uomt.description                                                                       AS c_uom_description,
         uomt.isactive                                                                          AS c_uom_isactive,
         uom.isdefault                                                                          AS c_uom_isdefault,
         uomt.name                                                                              AS c_uom_name,
         uom.stdprecision,
         uom.uomtype,
         uom.x12de355,
         asi.ad_org_id                                                                          AS m_asi_ad_org_id,
         asi.created                                                                            AS m_asi_created,
         asi.createdby                                                                          AS m_asi_createdby,
         asi.description                                                                        AS m_asi_description,
         asi.isactive                                                                           AS m_asi_isactive,
         asi.updated                                                                            AS m_asi_updated,
         asi.updatedby                                                                          AS m_asi_updatedby,
         l.ad_org_id                                                                            AS m_locator_ad_org_id,
         l.isactive                                                                             AS m_locator_isactive,
         l.isdefault,
         l.priorityno,
         l.value                                                                                AS m_locator_value,
         ol.ad_org_id                                                                           AS c_orderline_ad_org_id,
         ol.ad_orgtrx_id                                                                        AS c_orderline_ad_orgtrx_id,
         ol.c_activity_id                                                                       AS c_orderline_c_activity_id,
         ol.c_bpartner_id                                                                       AS c_orderline_c_bpartner_id,
         ol.c_bpartner_location_id                                                              AS c_orderline_c_bp_location_id,
         ol.c_charge_id                                                                         AS c_orderline_c_charge_id,
         ol.c_currency_id                                                                       AS c_orderline_c_currency_id,
         ol.c_order_id,
         ol.c_project_id                                                                        AS c_orderline_c_project_id,
         ol.c_projectphase_id                                                                   AS c_orderline_c_projectphase_id,
         ol.c_projecttask_id                                                                    AS c_orderline_c_projecttask_id,
         ol.created                                                                             AS c_orderline_created,
         ol.createdby                                                                           AS c_orderline_createdby,
         ol.c_tax_id                                                                            AS c_orderline_c_tax_id,
         ol.c_uom_id                                                                            AS c_orderline_c_uom_id,
         ol.datedelivered,
         ol.dateinvoiced,
         ol.dateordered,
         ol.datepromised                                                                        AS c_orderline_datepromised,
         ol.description                                                                         AS c_orderline_description,
         ol.discount,
         ol.freightamt                                                                          AS c_orderline_freightamt,
         ol.isactive                                                                            AS c_orderline_isactive,
         ol.isdescription                                                                       AS c_orderline_isdescription,
         ol.line                                                                                AS c_orderline_line,
         ol.linenetamt,
         ol.link_orderline_id,
         ol.m_attributesetinstance_id                                                           AS c_orderline_m_asi_id,
         ol.m_product_id                                                                        AS c_orderline_m_product_id,
         ol.m_promotion_id,
         ol.m_shipper_id                                                                        AS c_orderline_m_shipper_id,
         ol.m_warehouse_id                                                                      AS c_orderline_warehouse_id,
         ol.priceactual,
         ol.pricecost,
         ol.priceentered,
         ol.pricelimit,
         ol.pricelist,
         ol.processed                                                                           AS c_orderline_processed,
         ol.qtyentered                                                                          AS c_orderline_qtyentered,
         ol.qtyinvoiced,
         ol.qtylostsales,
         ol.qtyreserved,
         ol.ref_orderline_id,
         ol.rramt,
         ol.rrstartdate,
         ol.s_resourceassignment_id,
         ol.updated                                                                             AS c_orderline_updated,
         ol.updatedby                                                                           AS c_orderline_updatedby,
         ol.user1_id                                                                            AS c_orderline_user1_id,
         ol.user2_id                                                                            AS c_orderline_user2_id,
         ct.ad_org_id                                                                           AS c_charge_c_org_id,
         c.c_bpartner_id                                                                        AS c_charge_c_bpartner_id,
         c.c_chargetype_id,
         c.chargeamt                                                                            AS c_charge_chargeamt,
         c.c_taxcategory_id                                                                     AS c_charge_c_taxcategory_id,
         ct.description                                                                         AS c_charge_description,
         ct.isactive                                                                            AS c_charge_isactive,
         c.issamecurrency,
         c.issametax,
         c.istaxincluded                                                                        AS c_charge_istaxincluded
  FROM   m_inoutline iol
         JOIN c_uom uom
           ON iol.c_uom_id = uom.c_uom_id
         JOIN c_uom_trl uomt
           ON iol.c_uom_id = uomt.c_uom_id
         LEFT JOIN m_product p
                ON iol.m_product_id = p.m_product_id
         LEFT JOIN m_product_trl pt
                ON iol.m_product_id = pt.m_product_id
                   AND uomt.ad_language = pt.ad_language
         LEFT JOIN m_attributesetinstance asi
                ON iol.m_attributesetinstance_id = asi.m_attributesetinstance_id
         LEFT JOIN m_locator l
                ON iol.m_locator_id = l.m_locator_id
         LEFT JOIN c_orderline ol
                ON iol.c_orderline_id = ol.c_orderline_id
         LEFT JOIN c_charge c
                ON iol.c_charge_id = c.c_charge_id
         LEFT JOIN c_charge_trl ct
                ON iol.c_charge_id = ct.c_charge_id
  UNION
  SELECT iol.ad_client_id,
         iol.ad_org_id,
         iol.isactive,
         iol.created,
         iol.createdby,
         iol.updated,
         iol.updatedby,
         uomt.ad_language,
         iol.m_inout_id,
         iol.m_inoutline_id,
         iol.line + bl.line / 100    AS line,
         pt.m_product_id,
         CASE
           WHEN bl.isqtypercentage = 'N' THEN iol.movementqty * bl.qtybom
           ELSE iol.movementqty * ( bl.qtybatch / 100 )
         END                         AS movementqty,
         CASE
           WHEN bl.isqtypercentage = 'N' THEN iol.qtyentered * bl.qtybom
           ELSE iol.qtyentered * ( bl.qtybatch / 100 )
         END                         AS qtyentered,
         uomt.uomsymbol,
         NULL                        AS qtyordered,
         NULL                        AS qtydelivered,
         NULL                        AS qtybackordered,
         pt.name,
         b.description,
         pt.documentnote,
         p.upc,
         p.sku,
         p.value                     AS productvalue,
         iol.m_locator_id,
         l.m_warehouse_id,
         l.x,
         l.y,
         l.z,
         iol.m_attributesetinstance_id,
         asi.m_attributeset_id,
         asi.serno,
         asi.lot,
         asi.m_lot_id,
         asi.guaranteedate,
         pt.description              AS productdescription,
         p.imageurl,
         iol.c_campaign_id,
         iol.c_project_id,
         iol.c_activity_id,
         iol.c_projectphase_id,
         iol.c_projecttask_id,
         iol.ad_orgtrx_id,
         iol.c_charge_id,
         iol.confirmedqty,
         iol.c_orderline_id,
         iol.c_uom_id                AS m_inoutline_c_uom_id,
         iol.isdescription           AS m_inoutline_isdescription,
         iol.isinvoiced,
         iol.m_rmaline_id,
         iol.pickedqty,
         iol.processed               AS m_inoutline_processed,
         iol.ref_inoutline_id,
         iol.reversalline_id,
         iol.scrappedqty,
         iol.targetqty,
         iol.user1_id                AS m_inoutline_user1_id,
         iol.user2_id                AS m_inoutline_user2_id,
         pt.ad_org_id                AS m_product_ad_org_id,
         p.classification,
         p.copyfrom                  AS m_product_copyfrom,
         pt.created                  AS m_product_created,
         pt.createdby                AS m_product_createdby,
         p.c_revenuerecognition_id,
         p.c_subscriptiontype_id,
         p.c_taxcategory_id          AS m_product_c_taxcategory_id,
         p.c_uom_id                  AS m_product_c_uom_id,
         p.descriptionurl,
         p.discontinued,
         p.discontinuedat,
         p.group1,
         p.group2,
         p.guaranteedays,
         p.guaranteedaysmin,
         p.help,
         pt.isactive                 AS m_product_isactive,
         p.isbom,
         p.isdropship,
         p.isexcludeautodelivery,
         p.isinvoiceprintdetails,
         p.ispicklistprintdetails,
         p.ispurchased,
         p.isselfservice             AS m_product_isselfservice,
         p.issold,
         p.isstocked,
         p.issummary                 AS m_product_issummary,
         p.isverified,
         p.iswebstorefeatured,
         p.lowlevel,
         p.m_attributeset_id         AS m_product_m_attributeset_id,
         p.m_attributesetinstance_id AS m_product_m_asi_id,
         p.m_freightcategory_id,
         p.m_locator_id              AS m_product_m_locator_id,
         p.m_product_category_id     AS m_product_m_prod_category_id,
         p.processing                AS m_product_processing,
         p.producttype,
         p.r_mailtext_id,
         p.salesrep_id               AS m_product_salesrep_id,
         p.s_expensetype_id,
         p.shelfdepth,
         p.shelfheight,
         p.shelfwidth,
         p.s_resource_id             AS m_product_s_resource_id,
         p.unitsperpack,
         p.unitsperpallet,
         pt.updated                  AS m_product_updated,
         pt.updatedby                AS m_product_updatedby,
         p.versionno,
         p.volume,
         p.weight,
         uomt.ad_org_id              AS c_uom_ad_org_id,
         uom.costingprecision,
         uomt.description            AS c_uom_description,
         uomt.isactive               AS c_uom_isactive,
         uom.isdefault               AS c_uom_isdefault,
         uomt.name                   AS c_uom_name,
         uom.stdprecision,
         uom.uomtype,
         uom.x12de355,
         asi.ad_org_id               AS m_asi_ad_org_id,
         asi.created                 AS m_asi_created,
         asi.createdby               AS m_asi_createdby,
         asi.description             AS m_asi_description,
         asi.isactive                AS m_asi_isactive,
         asi.updated                 AS m_asi_updated,
         asi.updatedby               AS m_asi_updatedby,
         l.ad_org_id                 AS m_locator_ad_org_id,
         l.isactive                  AS m_locator_isactive,
         l.isdefault,
         l.priorityno,
         l.value                     AS m_locator_value,
         NULL                        AS c_orderline_ad_org_id,
         NULL                        AS c_orderline_ad_orgtrx_id,
         NULL                        AS c_orderline_c_activity_id,
         NULL                        AS c_orderline_c_bpartner_id,
         NULL                        AS c_orderline_c_bp_location_id,
         NULL                        AS c_orderline_c_charge_id,
         NULL                        AS c_orderline_c_currency_id,
         NULL                        AS c_order_id,
         NULL                        AS c_orderline_c_project_id,
         NULL                        AS c_orderline_c_projectphase_id,
         NULL                        AS c_orderline_c_projecttask_id,
         NULL                        AS c_orderline_created,
         NULL                        AS c_orderline_createdby,
         NULL                        AS c_orderline_c_tax_id,
         NULL                        AS c_orderline_c_uom_id,
         NULL                        AS datedelivered,
         NULL                        AS dateinvoiced,
         NULL                        AS dateordered,
         NULL                        AS c_orderline_datepromised,
         NULL                        AS c_orderline_description,
         NULL                        AS discount,
         NULL                        AS c_orderline_freightamt,
         NULL                        AS c_orderline_isactive,
         NULL                        AS c_orderline_isdescription,
         NULL                        AS c_orderline_line,
         NULL                        AS linenetamt,
         NULL                        AS link_orderline_id,
         NULL                        AS c_orderline_m_asi_id,
         NULL                        AS c_orderline_m_product_id,
         NULL                        AS m_promotion_id,
         NULL                        AS c_orderline_m_shipper_id,
         NULL                        AS c_orderline_warehouse_id,
         NULL                        AS priceactual,
         NULL                        AS pricecost,
         NULL                        AS priceentered,
         NULL                        AS pricelimit,
         NULL                        AS pricelist,
         NULL                        AS c_orderline_processed,
         NULL                        AS c_orderline_qtyentered,
         NULL                        AS qtyinvoiced,
         NULL                        AS qtylostsales,
         NULL                        AS qtyreserved,
         NULL                        AS ref_orderline_id,
         NULL                        AS rramt,
         NULL                        AS rrstartdate,
         NULL                        AS s_resourceassignment_id,
         NULL                        AS c_orderline_updated,
         NULL                        AS c_orderline_updatedby,
         NULL                        AS c_orderline_user1_id,
         NULL                        AS c_orderline_user2_id,
         NULL                        AS c_charge_c_org_id,
         NULL                        AS c_charge_c_bpartner_id,
         NULL                        AS c_chargetype_id,
         NULL                        AS c_charge_chargeamt,
         NULL                        AS c_charge_c_taxcategory_id,
         NULL                        AS c_charge_description,
         NULL                        AS c_charge_isactive,
         NULL                        AS issamecurrency,
         NULL                        AS issametax,
         NULL                        AS c_charge_istaxincluded
  FROM   pp_product_bom b
         JOIN m_inoutline iol
           ON b.m_product_id = iol.m_product_id
         JOIN m_product bp
           ON bp.m_product_id = iol.m_product_id
              AND bp.isbom = 'Y'
              AND bp.isverified = 'Y'
              AND bp.ispicklistprintdetails = 'Y'
         JOIN pp_product_bomline bl
           ON bl.pp_product_bom_id = b.pp_product_bom_id
         JOIN m_product p
           ON bl.m_product_id = p.m_product_id
         JOIN c_uom uom
           ON iol.c_uom_id = uom.c_uom_id
         JOIN c_uom_trl uomt
           ON p.c_uom_id = uomt.c_uom_id
         JOIN m_product_trl pt
           ON bl.m_product_id = pt.m_product_id
              AND uomt.ad_language = pt.ad_language
         LEFT JOIN m_attributesetinstance asi
                ON iol.m_attributesetinstance_id = asi.m_attributesetinstance_id
         LEFT JOIN m_locator l
                ON iol.m_locator_id = l.m_locator_id
;


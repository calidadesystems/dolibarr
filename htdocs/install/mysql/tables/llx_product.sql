-- ============================================================================
-- Copyright (C) 2002-2006 Rodolphe Quiedeville <rodolphe@quiedeville.org>
-- Copyright (C) 2008-2010 Laurent Destailleur  <eldy@users.sourceforge.net>
-- Copyright (C) 2005-2010 Regis Houssin        <regis.houssin@capnetworks.com>
-- Copyright (C) 2010      Juanjo Menent        <jmenent@2byte.es>
-- Copyright (C) 2012-2013 Cédric Salvador      <csalvador@gpcsolutions.fr>
-- Copyright (C) 2014      Marcos García        <marcosgdf@gmail.com>
--
-- This program is free software; you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation; either version 3 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program. If not, see <http://www.gnu.org/licenses/>.
--
-- ============================================================================

create table llx_product
(
  rowid						integer AUTO_INCREMENT PRIMARY KEY,
  ref                       varchar(128)  NOT NULL,
  entity                    integer   DEFAULT 1 NOT NULL,   -- Multi company id

  ref_ext                   varchar(128),                    -- reference into an external system (not used by dolibarr)

  datec						datetime,
  tms						timestamp,
  virtual					tinyint	  DEFAULT 0 NOT NULL,	-- Not used. Used by external modules. Value 0 for physical product, 1 for virtual product
  fk_parent					integer	  DEFAULT 0,			-- Not used. Used by external modules. Virtual product id

  label						varchar(255) NOT NULL,
  description				text,
  note						text,
  customcode                varchar(32),                    -- Optionnal custom code
  fk_country                integer DEFAULT NULL,                        -- Optionnal id of original country
  price						double(24,8) DEFAULT 0,
  price_ttc					double(24,8) DEFAULT 0,
  price_min					double(24,8) DEFAULT 0,
  price_min_ttc				double(24,8) DEFAULT 0,
  price_base_type			varchar(3)   DEFAULT 'HT',
  tva_tx					double(6,3),					  -- Default VAT rate of product
  recuperableonly           integer NOT NULL DEFAULT '0',  -- French NPR VAT
  localtax1_tx				double(6,3)  DEFAULT 0,         -- Spanish local VAT 1 
  localtax2_tx				double(6,3)  DEFAULT 0,         -- Spanish local VAT 2
  fk_user_author			integer DEFAULT NULL,			  -- user making creation
  fk_user_modif             integer,                         -- user making last change
  tosell					tinyint      DEFAULT 1,	          -- Product you sell
  tobuy						tinyint      DEFAULT 1,            -- Product you buy
  onportal     				tinyint      DEFAULT 0,	          -- If it is a product you sell and you want to sell it on portal (module website must be on)
  tobatch					tinyint      DEFAULT 0 NOT NULL,  -- Is it a product that need a batch or eat-by management
  fk_product_type			integer      DEFAULT 0,			-- Type of product: 0 for regular product, 1 for service, 9 for other (used by external module)
  duration					varchar(6),
  seuil_stock_alerte		integer      DEFAULT 0,
  url						varchar(255),
  barcode					varchar(255) DEFAULT NULL,
  fk_barcode_type			integer      DEFAULT NULL,
  accountancy_code_sell		varchar(32),                    -- Selling accountancy code
  accountancy_code_buy		varchar(32),                    -- Buying accountancy code
  partnumber				varchar(32),                    -- Not used. Used by external modules.
  weight					float        DEFAULT NULL,
  weight_units				tinyint      DEFAULT NULL,
  length					float        DEFAULT NULL,
  length_units				tinyint      DEFAULT NULL,
  surface					float        DEFAULT NULL,
  surface_units				tinyint      DEFAULT NULL,
  volume					float        DEFAULT NULL,
  volume_units				tinyint      DEFAULT NULL,
  stock						integer,						-- Current physical stock (dernormalized field)
  pmp						double(24,8) DEFAULT 0 NOT NULL,		-- To store valuation of stock calculated using average price method, for this product
  fifo						double(24,8),							-- To store valuation of stock calculated using fifo method, for this product
  lifo						double(24,8),							-- To store valuation of stock calculated using lifo method, for this product
  canvas					varchar(32)  DEFAULT NULL,
  finished					tinyint      DEFAULT NULL,
  hidden					tinyint      DEFAULT 0,			-- Not used. Deprecated.
  import_key				varchar(14),					-- Import key
  fk_price_expression integer,                     -- Link to the rule for dynamic price calculation
  desiredstock              integer      DEFAULT 0,
  fk_unit					integer      DEFAULT NULL
)ENGINE=innodb;

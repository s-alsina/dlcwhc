{**
 * 2007-2017 PrestaShop
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Open Software License (OSL 3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * http://opensource.org/licenses/osl-3.0.php
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to http://www.prestashop.com for more information.
 *
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright 2007-2017 PrestaShop SA
 * @license   http://opensource.org/licenses/osl-3.0.php Open Software License (OSL 3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}

 <div class="product-add-cart js-product-add-cart-{$product.id}-{$product.id_product_attribute}" >

 {if !isset($max_quantity)}
     {assign var="max_quantity" value=$product.quantity}
 {/if}

 {if $product.add_to_cart_url && ($max_quantity > 0 || $product.allow_oosp) && !$configuration.is_catalog}
     <form action="{$urls.pages.cart}" method="post">

         <input type="hidden" name="id_product" value="{$product.id}">

        
             <input type="hidden" name="token" value="{$static_token}">
             <input type="hidden" name="id_product_attribute" value="{$product.id_product_attribute}">
         <div class="input-group-add-cart productCartDlcButton">
             <input
                     type="number"
                     name="qty"
                     value="{if isset($product.product_attribute_minimal_quantity) && $product.product_attribute_minimal_quantity neq ''}{if $product.product_attribute_minimal_quantity}{$product.product_attribute_minimal_quantity}{else}1{/if}{else}{if $product.minimal_quantity}{$product.minimal_quantity}{else}1{/if}{/if}"
                     class="form-control input-qty"
                     min="{if isset($product.product_attribute_minimal_quantity) && $product.product_attribute_minimal_quantity neq ''}{if $product.product_attribute_minimal_quantity}{$product.product_attribute_minimal_quantity}{else}1{/if}{else}{if $product.minimal_quantity}{$product.minimal_quantity}{else}1{/if}{/if}"
                     {if !$product.allow_oosp}max="{$max_quantity}"{/if}
             >

             <button
                     class="btn btn-product-list add-to-cart productCartDlcButtonStyle"
                     data-button-action="add-to-cart"
                     type="submit"
                     {if !$product.add_to_cart_url}
                         disabled
                     {/if}
             ><i class="fa fa-shopping-bag fa-fw bag-icon"
                 aria-hidden="true"></i> <i class="fa fa-circle-o-notch fa-spin fa-fw spinner-icon" aria-hidden="true"></i> {l s='Add to cart' d='Shop.Theme.Actions'}
             </button>
         </div>
     </form>
 {else}
     <a href="{$product.url}"
        class="btn btn-product-list productCartDlcButtonStyle"
     > {l s='View' d='Shop.Theme.Actions'}
     </a>
 {/if}
</div>
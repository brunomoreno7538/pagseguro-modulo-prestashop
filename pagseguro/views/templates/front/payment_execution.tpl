{if $version >= '1.5'}
    <style type="text/css" media="all">{literal}div#center_column{ width: 757px; }{/literal}</style>
{else}
    <style type="text/css" media="all">{literal}div#center_column{ width: 535px; }{/literal}</style>
{/if}

{capture name=path}{l s='Pagamento via PagSeguro' mod='pagseguro'}{/capture}
{include file="$tpl_dir./breadcrumb.tpl"}

<h2>{l s='Resumo da compra' mod='pagseguro'}</h2>
teste 1
{assign var='current_step' value='payment'}
{include file="$tpl_dir./order-steps.tpl"}

{if isset($nbProducts) && $nbProducts <= 0}
	<p class="warning">{l s='Seu carrinho de compras está vazio.'}</p>
{else}

<h3>{l s='Pagamento via PagSeguro' mod='pagseguro'}</h3>
<form action="{$action_url}" method="post">
	<p>
		<img src="{$image}" alt="{l s='pagseguro' mod='pagseguro'}" width="86" height="49" style="float:left; margin: 0px 10px 5px 0px;" />
		{l s='Você escolheu efetuar o pagamento via PagSeguro' mod='pagseguro'}
		<br/><br />
		{l s='Breve resumo da sua compra:' mod='pagseguro'}
	</p>
	<p style="margin-top:20px;">
		- {l s='O valor total de sua compra é ' mod='pagseguro'}
		<span id="amount" class="price">{displayPrice price=$total}</span>
		{if $use_taxes == 1}
			{l s='(tax incl.)' mod='pagseguro'}
		{/if}
	</p>
    {if $current_currency_name != "Real"}
        <p>
		{l s='Moeda atual: ' mod='pagseguro'}&nbsp;<b>{$current_currency_name}</b>
                <input type="hidden" name="currency_payement" value="{$current_currency_id}" />
	</p>
        {/if}
	<p style="margin-top:20px;">
            {l s='Aceitamos a seguinte moeda para efetuar seu pagamento via PagSeguro: ' mod='pagseguro'}&nbsp;<b>Real</b>
                <input type="hidden" name="currency_payement" />
	</p>
        {if $current_currency_name != "Real" && $total_real > 0.00}
	<p>
		- {l s='O valor total de sua compra convertido é ' mod='pagseguro'}
                <span id="amount" class="price">{displayPrice price=$total_real currency=$currency_real}</span>
		{if $use_taxes == 1}
			{l s='(tax incl.)' mod='pagseguro'}
		{/if}
	</p>
        {/if}
	<p>
		<br /><br />
		<b>{l s='Por favor, confirme sua compra clicando no botão \'Confirmo minha compra\'' mod='pagseguro'}.</b>
	</p>
	<p class="cart_navigation">
		<input type="submit" name="submit" value="{l s='Confirmo minha compra' mod='pagseguro'}" class="exclusive_large" />
		<a href="{$link->getPageLink('order', true, NULL, "step=3")}" class="button_large">{l s='Outros formas de pagamento' mod='pagseguro'}</a>
	</p>
</form>
{/if}

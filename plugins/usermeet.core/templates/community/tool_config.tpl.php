<H1>Community</H1>
<br>

<div class="block">
<form action="{devblocks_url}{/devblocks_url}" method="post">
<input type="hidden" name="c" value="community">
<input type="hidden" name="a" value="saveConfiguration">
<input type="hidden" name="code" value="{$instance.ct_code}">

<H2>{$tool->manifest->name}</H2>
Community: <b>{$community->name}</b><br>
Profile ID: <b>{$instance.ct_code}</b> [<a href="javascript:;">?</a>]<br>
<br>

{$tool->configure($instance)}

<br>
<button type="submit"><img src="{devblocks_url}c=resource&p=cerberusweb.core&f=images/check.gif{/devblocks_url}" align="top"> {$translate->_('common.save_changes')|capitalize}</button>
<button type="button" onclick="javascript:document.location='{devblocks_url}c=community{/devblocks_url}';"><img src="{devblocks_url}c=resource&p=cerberusweb.core&f=images/delete.gif{/devblocks_url}" align="top"> {$translate->_('common.cancel')|capitalize}</button>

</form>
</div>
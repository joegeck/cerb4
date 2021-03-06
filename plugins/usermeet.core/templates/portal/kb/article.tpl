{include file="$tpl_path/portal/kb/header.tpl"}

<table style="text-align: left; width: 100%;" border="0" cellpadding="0" cellspacing="0">
	<tbody>
		<tr>
			<td style="padding: 5px; vertical-align: top;">
				<div id="kbArticle">
				<h2 style="margin:0px;">{$article->title}</h2>
				
				<div style="padding-bottom:5px;font-size:90%;">
				{if !empty($breadcrumbs)}
					{foreach from=$breadcrumbs item=bread_stack}
						<a href="{devblocks_url}c=browse{/devblocks_url}">{$translate->_('portal.kb.public.top')}</a> ::
						{foreach from=$bread_stack item=bread_id}
							<a href="{devblocks_url}c=browse&id={$bread_id|string_format:"%06d"}{/devblocks_url}">{$categories.$bread_id->name}</a> :
						{/foreach}
						<br> 
					{/foreach} 
				{/if}
				</div>
				
				<br>
				
				{if !empty($article->content)}
					{if !$article->format}{$article->content|escape|nl2br}{else}{$article->content}{/if}<br>
				{else}
					<i>[[ {$translate->_('portal.kb.public.no_content')} ]]</i><br>
				{/if}
				<br>
				
				<!-- 
				<div style="margin: 10px; padding: 10px; background-color: rgb(230, 230, 230);">
					<h3 style="margin-top: 2px;">Provide Feedback</h3>
					<b>Did this article help you?</b><br>
					(_) Yes (_) No<br>
					<br>
					<b>Comments:</b><br>
					<textarea style="width: 100%; height: 80px;"></textarea><br>
					<br>
					<button type="button">Submit</button>
					<br>
				</div>
				 -->
				 </div>
			</td>
			<td style="width: 200px; white-space: nowrap; vertical-align: top;">
				<div style="border-left: 1px solid rgb(200, 200, 200); border-right: 1px solid rgb(200, 200, 180); padding: 10px; margin-right: 5px; background-color: rgb(245, 245, 255);">
					<form action="{devblocks_url}c=search{/devblocks_url}" method="post">
					<input type="hidden" name="a" value="doSearch">
					<b>{$translate->_('common.search')|capitalize}</b><br>
					<input name="query" value="" size="16" style="width: 150px;" type="text"><button type="submit">&raquo;</button>
					</form>
					<br>
					<b>{$translate->_('portal.kb.public.article_tools')}</b><br>
					{if !empty($editor) && !empty($article)}<img src="{devblocks_url}c=resource&p=usermeet.core&f=images/document_edit.gif{/devblocks_url}" alt="Edit" align="top"> <a href="{devblocks_url}c=edit&id={$article->id}{/devblocks_url}">{$translate->_('common.edit')|capitalize}</a><br>{/if}
					<img src="{devblocks_url}c=resource&p=usermeet.core&f=images/printer.gif{/devblocks_url}" alt="Printer" align="top"> <a href="javascript:;" onclick="window.print();">{$translate->_('common.print')|capitalize}</a><br>
					{*<img src="{devblocks_url}c=resource&p=usermeet.core&f=images/feed-icon-16x16.gif{/devblocks_url}" alt="RSS Feed" align="top" border="0"> <a href="{devblocks_url}c=rss&a=article&id={$article->id|string_format:"%06d"}{/devblocks_url}">View as RSS</a><br>*}
				</div>
			</td>
		</tr>
	</tbody>
</table>

{include file="$tpl_path/portal/kb/footer.tpl"}

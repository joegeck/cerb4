<table cellpadding="0" cellspacing="0" border="0" width="98%">
	<tr>
		<td align="left" width="0%" nowrap="nowrap" style="padding-right:5px;"><img src="{devblocks_url}c=resource&p=cerberusweb.core&f=images/gear.gif{/devblocks_url}" align="absmiddle"></td>
		<td align="left" width="100%" nowrap="nowrap"><h1>Tasks</h1></td>
	</tr>
</table>

<form action="{devblocks_url}{/devblocks_url}" method="POST" id="formTaskPeek" name="formTaskPeek" onsubmit="return false;">
<input type="hidden" name="c" value="tasks">
<input type="hidden" name="a" value="saveTaskPeek">
<input type="hidden" name="id" value="{$task->id}">
<input type="hidden" name="view_id" value="{$view_id}">
<input type="hidden" name="do_delete" value="0">

<div style="height:350px;overflow:auto;margin:2px;padding:3px;">

<table cellpadding="0" cellspacing="2" border="0" width="98%">
	{if !empty($link_namespace) && !empty($link_object_id)}
	<tr>
		<td width="0%" nowrap="nowrap" align="right" valign="top">Link: </td>
		<td width="100%">
			<input type="hidden" name="link_namespace" value="{$link_namespace}">
			<input type="hidden" name="link_object_id" value="{$link_object_id}">
			{$link_namespace}={$link_object_id}
		</td>
	</tr>
	{/if}
	{if !empty($source_info)}
	<tr>
		<td width="0%" nowrap="nowrap" align="right" valign="top">Source: </td>
		<td width="100%">
			<a href="{$source_info.url}" title="{$source_info.name|escape}">{$source_info.name|truncate:75:'...':true}</a>
		</td>
	</tr>
	{/if}
	<tr>
		<td width="0%" nowrap="nowrap" align="right">Title: </td>
		<td width="100%">
			<input type="text" name="title" style="width:98%;" value="{$task->title|escape}">
		</td>
	</tr>
	<tr>
		<td width="0%" nowrap="nowrap" align="right" valign="top">Due: </td>
		<td width="100%">
			<input type="text" name="due_date" size="45" value="{if !empty($task->due_date)}{$task->due_date|devblocks_date}{/if}"><button type="button" onclick="ajax.getDateChooser('dateTaskDue',this.form.due_date);">&nbsp;<img src="{devblocks_url}c=resource&p=cerberusweb.core&f=images/calendar.gif{/devblocks_url}" align="top">&nbsp;</button>
			<div id="dateTaskDue" style="display:none;position:absolute;z-index:1;"></div>
		</td>
	</tr>
	<tr>
		<td width="0%" nowrap="nowrap" align="right">Worker: </td>
		<td width="100%">
			<select name="worker_id">
				<option value="0">&nbsp;</option>
				{foreach from=$workers item=worker key=worker_id name=workers}
				{if $worker_id==$active_worker->id}{assign var=active_worker_sel_id value=$smarty.foreach.workers.iteration}{/if}
				<option value="{$worker_id}" {if $worker_id==$task->worker_id}selected{/if}>{$worker->getName()}</option>
				{/foreach}
			</select>{if !empty($active_worker_sel_id)}<button type="button" onclick="this.form.worker_id.selectedIndex = {$active_worker_sel_id};">me</button>{/if}
		</td>
	</tr>
	<tr>
		<td width="0%" nowrap="nowrap" align="right" valign="top">Description: </td>
		<td width="100%">
			<textarea name="content" style="width:98%;height:100px;">{$task->content|escape}</textarea>
		</td>
	</tr>
	<tr>
		<td width="0%" nowrap="nowrap" align="right" valign="top"><label for="checkTaskCompleted">Completed:</label> </td>
		<td width="100%">
			<input id="checkTaskCompleted" type="checkbox" name="completed" value="1" {if $task->is_completed}checked{/if}>
		</td>
	</tr>
</table>

{include file="file:$core_tpl/internal/custom_fields/bulk/form.tpl" bulk=false}

</div>

{if ($active_worker->hasPriv('core.tasks.actions.create') && (empty($task) || $active_worker->id==$task->worker_id))
	|| ($active_worker->hasPriv('core.tasks.actions.update_nobody') && empty($task->worker_id)) 
	|| $active_worker->hasPriv('core.tasks.actions.update_all')
}
	<button type="button" onclick="genericPanel.hide();genericAjaxPost('formTaskPeek', 'view{$view_id}')"><img src="{devblocks_url}c=resource&p=cerberusweb.core&f=images/check.gif{/devblocks_url}" align="top"> {$translate->_('common.save_changes')}</button>
	<button type="button" onclick="if(confirm('Are you sure you want to permanently delete this task?')){literal}{{/literal}this.form.do_delete.value='1';genericPanel.hide();genericAjaxPost('formTaskPeek', 'view{$view_id}');{literal}}{/literal}"><img src="{devblocks_url}c=resource&p=cerberusweb.core&f=images/delete2.gif{/devblocks_url}" align="top"> {$translate->_('common.delete')|capitalize}</button>
	<button type="button" onclick="genericPanel.hide();"><img src="{devblocks_url}c=resource&p=cerberusweb.core&f=images/delete.gif{/devblocks_url}" align="top"> {$translate->_('common.cancel')|capitalize}</button>
{else}
	<div class="error">You do not have permission to modify this record.</div>
{/if}
<br>
</form>

{def $node = fetch('content', 'node', hash('node_id', $module_result.node_id))}
{attribute_view_gui attribute=$node.object.data_map.column}
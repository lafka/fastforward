{*retrieve the template based on the class identifier*}
{include uri="design:content/view/"|append($node.object.class_identifier, '/full.tpl') node=$node}
module ApplicationHelper
  def tag_hidden_if(tag_name, condition, attrs = {}, &block)
    if condition
      attrs["style"] = "display: none;"
    end
    content_tag(tag_name, attrs, &block)
  end
  
  def div_hidden_if(condition, attrs = {}, &block)
    tag_hidden_if("div", condition, attrs, &block)
  end
end

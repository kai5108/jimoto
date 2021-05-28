class SearchesController < ApplicationController
  def search
    @model = params["search"]["model"]
    @content = params["search"]["content"]
    @how = params["search"]["how"]
    @datas = search_for(@how, @model, @content)
  end
  
  private
  def match(model, content)
    if model == 'place'
      Place.where(name: content)
    end
  end
  
  def partical(model, content)
    if model == 'place'
      Place.where("name LIKE ?", "%#{content}%")
    end
  end
  
  def search_for(how, model, content)
    case how
    # 完全一致
    when 'match'
      match(model, content)
    # 部分一致
    when 'partical'
      partical(model, content)
    end
  end
end
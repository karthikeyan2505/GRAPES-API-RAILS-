module Article 
  class Data < Grape::API
    resource :article_data do
      desc "list the all article"
    params do     
      requires :title, type: String
      requires :content, type: String 
    end
    desc "create a new article"
    post do 
      NewArticle.create!(
      {
        title:params[ :title],
        content:params[ :content]
      }
    ) 
    end 
    get do 
      NewArticle.all
    end
    desc "delete the article"
    params do
      requires :id, type: String
    end
    delete ':id' do
      NewArticle.find(params[ :id]).destroy!
    end  
    desc "update the article"
    params do 
      requires :id, type: String
      requires :title, type: String
    end
    put ':id' do
      NewArticle.find(params[ :id]).update(
        {
           title:params[ :title]
        })
    end 
    end  
  end    
end 

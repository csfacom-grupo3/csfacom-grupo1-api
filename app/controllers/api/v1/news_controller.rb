class Api::V1::NewsController < ApplicationController
  before_action :authenticate_user_from_token, except: [:index]
  before_action :user_is_admin_or_news?, except: [:index]
  before_action :find_news, except: [:index, :create]

  def index
    render_success(serialize_resource_list(News.all, News::LightSerializer))
  end

  def create
    @news = News.create(news_params)

    render_created(serialize_resource(@news, News::FullSerializer))
  end

  def show
    render_success(serialize_resource(@news, News::FullSerializer))
  end

  def update
    @news.news_projects.destroy_all

    return render_success(serialize_resource(@news, News::FullSerializer)) if @news.update(news_params)

    render_unprocessable_entity(@news.errors.full_messages)
  end

  def destroy
    render_success if @news.destroy
  end

  private

  def news_params
    params.permit(:id, :title, :subtitle, :content, :visibility, images: [], news_projects_attributes: [:project_id])
  end

  def find_news
    @news = News.find_by(id: news_params[:id])

    render_not_found unless @news.present?
  end

end

class GroupsController < ApplicationController
  before_action :set_group, only: [:show]

  def index
    @groups = Group.all
    set_meta_tags title: "分类列表", description: "提供rails文章和视频教程，知识和信息交流", keywords: @groups.map(&:name).join(", ")
  end

  def show
    set_meta_tags title: @group.name, description: @group.name, keywords: @group.articles.map(&:tag_list)
  end

  private
    def set_group
      @group = Group.find(params[:id])
    end
end

class ArticlePolicy < ApplicationPolicy
  def approve?
    user.admin?
  end

  def reject?
    user.admin?
  end

  def create?
    user
  end

  def update?
    user
  end

  def destroy?
    user
  end
end

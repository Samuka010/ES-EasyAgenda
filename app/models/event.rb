class Event < ApplicationRecord

  enum status: { active: "active", removed: "removed" }

  belongs_to :category

  validates :name, presence: true
  validates :started_at, presence: true
  validates :finished_at, presence: true
  validates :name, length: { minimum: 3, maximum: 100, allow_blank: true}
  validate :validate_if_start_in_future, on: :create
  validate :validate_if_finished_greater_than_started

  scope :with_category, -> { includes(:category) }
  #scope :today, -> { where("started_at >= ? AND started_at <= ?", Date.current.beginning_of_day, Date.current.end_of_day) }
  scope :today, -> { where(started_at: Date.current.beginning_of_day..Date.current.end_of_day) }
  scope :in_period, ->(period_start, period_end) { where("started_at >= ? AND started_at <= ?", period_start, period_end)}

  has_one_attached :file
  has_rich_text  :description

  private

  #Regra: Data de Finalização não pode ser menor que a data de criação do evento
  def validate_if_finished_greater_than_started
    return unless started_at
    return unless finished_at
    return if finished_at > started_at

    errors.add(:finished_at, :invalid)
  end

  #Regra: Data de Inicio não pode ser setada no passado na criação do Evento
  #TODO: Ajuste o TIme.current ele da erro pois não consegui pegar a data e hora correta esta 2horas na frente
  def validate_if_start_in_future
    return unless started_at
    return if started_at >= Time.current

    errors.add(:started_at, :invalid)
  end
end

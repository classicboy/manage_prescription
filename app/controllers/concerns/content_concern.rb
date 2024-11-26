module ContentConcern
  extend ActiveSupport::Concern

  private

  # rubocop:disable Metrics/AbcSize
  def filter_records(scope, options: params.slice(:search_query, :start_date, :end_date))
    if options[:search_query].present?
      scope = scope.where("name ILIKE :query OR phone ILIKE :query",
                          { query: "%#{options[:search_query]}%" })
    end

    if options[:start_date].present?
      start_date = Date.parse(options[:start_date]).beginning_of_day
      scope = scope.where("date >= ?", start_date)
    end

    if options[:end_date].present?
      end_date = Date.parse(options[:end_date]).end_of_day
      scope = scope.where("date <= ?", end_date)
    end

    scope
  end
  # rubocop:enable Metrics/AbcSize
end

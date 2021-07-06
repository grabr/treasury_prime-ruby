require 'uri'

module TreasuryPrime
  class PaginatedCollection
    include Enumerable

    class << self
      def from_payload(payload, wrapper)
        next_page = payload['page_next']

        next_page_uri = next_page && URI.parse(next_page)
        next_page_cursor = next_page && URI.decode_www_form(next_page_uri.query).to_h['page_cursor']

        new(
          payload['data'],
          wrapper: wrapper,
          next_page_url: next_page,
          next_page_cursor: next_page_cursor
        )
      end
    end

    attr_reader :next_page_url, :next_page_cursor

    def initialize(data, wrapper:, next_page_url: nil, next_page_cursor: nil)
      @data = data.map { |item| wrapper.new(item) }
      @next_page_url = next_page_url
      @next_page_cursor = next_page_cursor
    end

    def each(&block)
      @data.each(&block)
    end

    def last
      @data.last
    end

    def first
      @data.first
    end

    def last_page?
      @next_page_url.nil?
    end
  end
end

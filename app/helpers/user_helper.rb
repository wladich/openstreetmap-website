module UserHelper

  # Taken from stackoverflow http://stackoverflow.com/questions/4216906/automatically-append-parameters-to-url-or-path-methods-rails/4228338#4228338
  # and adapted slightly to remove dependency on Addressable module. I'm not convined it all works though
  def url_for(options={})
    @url_additional_params = {} unless @url_additional_params
    options = case options
      when String
        query = []
        @url_additional_params.each do |k,v|
          query << URI::encode(k) + "=" + URI::encode(v)
        end

        options + (options.index('?').nil? ? '?' : '&') + query.join('&')
      when Hash
        options.reverse_merge(@url_additional_params)
      else
        options
      end

    super
  end
end
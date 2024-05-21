if ENV['ELASTICSEARCH_USER'].present?
  Searchkick.client_options = {
    transport_options: {
      ssl: {
        verify: false
      }
    }
  }
  ENV['ELASTICSEARCH_URL'] = "https://#{ENV['ELASTICSEARCH_USER'].strip}:#{ENV['ELASTICSEARCH_PASSWORD'].strip}@#{ENV['ELASTICSEARCH_HOST'].strip}:#{ENV['ELASTICSEARCH_PORT'].strip}"
else
  ENV['ELASTICSEARCH_URL'] = "#{ENV['ELASTICSEARCH_HOST'] || 'localhost'}:9200}"
end

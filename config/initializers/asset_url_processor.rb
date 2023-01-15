class AssetUrlProcessor
  def self.call(input)
    context = input[:environment].context_class.new(input)
    data = input[:data].gsub(/asset-url\(["']?(.+?)["']?\)/) do |_match|
      "url(#{context.asset_path($1)})"
    end
    {data: data}
  end
end

Sprockets.register_postprocessor "text/css", AssetUrlProcessor

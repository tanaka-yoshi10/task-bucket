if Rails.env.development?
  JSRailsRoutes.configure do |c|
    c.include_paths = %r{^/(api/|tasks)}
    c.output_dir = Rails.root.join('app', 'javascript', 'javascripts')
    c.camelize = :lower
  end
end

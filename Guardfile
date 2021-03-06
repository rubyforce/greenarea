guard 'bundler' do
  watch('Gemfile')
end

guard 'spork', wait: 60, cucumber: false, rspec: true, test_unit: false do
  watch('config/application.rb')
  watch('config/environment.rb')
  watch(%r{^config/environments/.+\.rb$})
  watch(%r{^config/initializers/.+\.rb$})
  watch('Gemfile')
  watch('spec/spec_helper.rb')
end

guard 'rspec', :version => 2, :all_after_pass => false, :cli => "--drb --format documentation" do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})     { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')  { "spec" }

  # Rails example
  watch(%r{^app/(.+)\.rb$})                           { |m| "spec/#{m[1]}_spec.rb" }
  watch(%r{^app/(.*)(\.erb|\.haml)$})                 { |m| "spec/#{m[1]}#{m[2]}_spec.rb" }
  watch(%r{^app/controllers/(.+)_(controller)\.rb$})  { |m| ["spec/#{m[2]}s/#{m[1]}_#{m[2]}_spec.rb"] }
  watch(%r{^spec/support/(.+)\.rb$})                  { "spec" }
  watch(%r{^spec/factories/(.+)\.rb$})                { "spec" }
  watch(%r{^app/api/(.+)\.rb$})                       { |m| ["spec/api/#{m[1]}_spec.rb"] }
  watch(%r{^app/models/(.+)\.rb$})                    { |m| ["spec/models/#{m[1]}_spec.rb"] }
  watch(%r{^lib/(.+)\.rb$})                           { |m| ["spec/#{m[1]}_spec.rb"] }
  watch('config/routes.rb')                           { "spec/controllers" }
  watch('app/controllers/application_controller.rb')  { "spec/controllers" }
end


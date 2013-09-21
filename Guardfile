guard 'motion' do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^app/controllers/(.+)\.rb$})     { |m| "./spec/#{m[1]}_spec.rb" }
  watch(%r{^app/models/(.+)\.rb$})     { |m| "./spec/#{m[1]}_spec.rb" }
  watch(%r{^app/lib/(.+)\.rb$})     { |m| "./spec/#{m[1]}_spec.rb" }
  watch(%r{^app/(.+)\.rb$})     { |m| "./spec/#{m[1]}_spec.rb" }
end

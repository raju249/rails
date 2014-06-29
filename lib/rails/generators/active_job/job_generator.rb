require 'rails/generators/named_base'

module ActiveJob
  module Generators # :nodoc:
    class JobGenerator < Rails::Generators::NamedBase # :nodoc:
      desc 'This generator creates an active job file at app/jobs'

      class_option :queue, type: :string, default: 'default', desc: 'The queue name for the generated job'

      def self.default_generator_root
        File.dirname(__FILE__)
      end

      check_class_collision suffix: 'Job'

      def create_job_file
        template 'job.rb', File.join('app/jobs', class_path, "#{file_name}_job.rb")
      end

    end
  end
end
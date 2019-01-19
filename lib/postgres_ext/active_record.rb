require 'active_record'
require 'active_record/relation'
require 'postgres_ext/active_record/relation'
require 'postgres_ext/active_record/cte_proxy'

gdep = Gem::Dependency.new('activerecord', '>= 5.0.0')
ar_version_cutoff = gdep.matching_specs.sort_by(&:version).last

if ar_version_cutoff
  require 'postgres_ext/active_record/5.0/query_methods'
  require 'postgres_ext/active_record/5.0/querying'
  if Gem::Dependency.new('activerecord', '>= 5.2.0').matching_specs.sort_by(&:version).last
    require 'postgres_ext/active_record/5.2/relation'
  else
    require 'postgres_ext/active_record/5.0/relation'
  end
else
  require 'postgres_ext/active_record/4.x/query_methods'
  require 'postgres_ext/active_record/4.x/querying'
end
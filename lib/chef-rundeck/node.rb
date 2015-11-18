module ChefRundeckX
  class Node < Hash
    def initialize
      super
    end

    def =~(other_hash)
      alike = true
      other_hash.each do |k,v|
        is_csv = (! /([a-zA-Z0-9]+,)+/.match(v).nil?)

        if is_csv
          require 'set'
          filter = Set.new v.split(",")
          value = if (fetch k).class != Array
            Set.new [ (fetch k) ]
          else
            Set.new (fetch k)
          end

          alike = ((filter &  value) != Set.new([]))
          if ! alike
            break
          end
        else
          value = if (fetch k).class == Array
            (fetch k).join(",")
          else
            (fetch k)
          end

          if (Regexp.new(v) =~ (value)).nil?
            alike = false
            break
          end
        end
      end

      alike
    end

    def update(other_hash)
      if other_hash.has_key? 'roles' && ! other_hash['roles'].nil?
        other_hash['roles'] = other_hash['roles'].join(',')
      end

      if other_hash.has_key? 'tags' && ! other_hash['roles'].nil?
        other_hash['tags'] = other_hash['tags'].join(',')
      end

      super other_hash
    end
  end
end

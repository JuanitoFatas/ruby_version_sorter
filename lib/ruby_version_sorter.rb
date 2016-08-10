require "ruby_version_sorter/version"

class RubyVersionSorter
  def self.sort(versions)
    new(versions).send :move_prereleases
  end

  def initialize(versions)
    pre_releases, @non_pre_releases = versions.sort.partition { |v| v =~ PRERELEASE_REGEXP }
    @pre_release_groups = pre_releases.group_by { |v| node_identifier(v) }
  end

  private

    PRERELEASE_REGEXP = /((preview|rc|RC|pre|b)\d{1})/
    IDENTIFIER_REGEXP = /([\d+\.])*/

    private_constant :PRERELEASE_REGEXP, :IDENTIFIER_REGEXP

    attr_reader :versions, :non_pre_releases, :pre_release_groups

    def move_prereleases
      pre_release_groups.each_with_index do |(version_lead, versions), index|
        node_index = version_nodes.index { |node| node[0] == version_lead }

        insert_index = get_insert_index(node_index)

        non_pre_releases.insert(insert_index, *versions)

        version_nodes(true) if !(index == pre_release_group_length - 1)
      end

      non_pre_releases
    end

    def pre_release_group_length
      @_pre_release_group_length ||= pre_release_groups.size
    end

    def get_insert_index(node_index)
      if node_index == 0
        0
      elsif node_index == nil
        -1
      else
        version_nodes[node_index].last
      end
    end

    def node_identifier(version)
      version[IDENTIFIER_REGEXP]
    end

    def version_nodes(recompute = false)
      if recompute
        @_evolve_graph = compute_version_nodes
      else
        @_evolve_graph ||= compute_version_nodes
      end
    end

    def compute_version_nodes
      non_pre_releases.
        uniq { |version| node_identifier(version) }.
        map.with_index { |version, index| [node_identifier(version), index] }
    end
end

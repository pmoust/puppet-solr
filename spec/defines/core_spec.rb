require 'spec_helper'

describe 'solr::core', :type => :define do
  let(:title) { 'default' }

  it { should contain_file('/usr/share/solr/default').with({
    'ensure'    => 'directory',
    'owner'     => 'jetty',
    'group'     => 'jetty',
    'require'   => 'File[/usr/share/solr]'})
  }

  it { should contain_file('core-default-conf').with({
    'ensure'    =>    'directory',
    'recurse'   =>    'true',
    'path'      =>    '/usr/share/solr/default/conf',
    'source'    =>    'puppet:///modules/solr/conf',
    'require'   =>    'File[/usr/share/solr/default]'})
  }

end


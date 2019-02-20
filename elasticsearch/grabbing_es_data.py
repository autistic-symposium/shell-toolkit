import elasticsearch
import whois
import json

from elasticsearch import Elasticsearch

es = Elasticsearch([{ 'host': "HOST NAME"}])

query = {
  'size': 100,
  'query': {
    'filtered': {
      'query': {
        'query_string': {
          'query': 'type:named_query_log',
          'analyze_wildcard': True
        }
    },
  'filter': {
    'bool': {
      'must_not': {
        'query_string': {
          'query': '*HOST.com OR *otherhost.com',
          'analyze_wildcard': True
        }
      }
    }
  }
}}}

# Make the search
res = es.search(index="LOG-NAME", body=query)

results = []
counter = 0
# Print out our results
for hit in res['hits']['hits']:
  if "dns_dest" in hit['_source'].keys():
    try:
      results.append(json.dumps(whois.whois(hit['_source']['dns_dest'])))
    except Exception as e:
      pass
  counter += 1
  print "Scanning {0}/{1} domains, {2} succeeded..".format(counter, len(res['hits']['hits']), len(results))

with open('processed_domains.txt', 'w') as outfile:
  json.dump(results, outfile)


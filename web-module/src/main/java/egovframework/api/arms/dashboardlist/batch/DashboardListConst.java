package egovframework.api.arms.dashboardlist.batch;

/**
 * Created by Administrator on 2021-01-09.
 */
public class DashboardListConst {

    public static final String DASHBOARD_TEMPLATE = "{\n" +
            "  \"dashboard\": {\n" +
            "    \"annotations\": {\n" +
            "      \"list\": [\n" +
            "        {\n" +
            "          \"$$hashKey\": \"object:254\",\n" +
            "          \"builtIn\": 1,\n" +
            "          \"datasource\": \"-- Grafana --\",\n" +
            "          \"enable\": true,\n" +
            "          \"hide\": true,\n" +
            "          \"iconColor\": \"rgba(0, 211, 255, 1)\",\n" +
            "          \"name\": \"Annotations & Alerts\",\n" +
            "          \"type\": \"dashboard\"\n" +
            "        }\n" +
            "      ]\n" +
            "    },\n" +
            "    \"editable\": true,\n" +
            "    \"gnetId\": null,\n" +
            "    \"graphTooltip\": 0,\n" +
            "    \"id\": null,\n" +
            "    \"iteration\": 1610345133835,\n" +
            "    \"links\": [],\n" +
            "    \"panels\": [\n" +
            "      {\n" +
            "        \"aliasColors\": {},\n" +
            "        \"bars\": false,\n" +
            "        \"dashLength\": 10,\n" +
            "        \"dashes\": false,\n" +
            "        \"datasource\": null,\n" +
            "        \"fill\": 1,\n" +
            "        \"fillGradient\": 0,\n" +
            "        \"gridPos\": {\n" +
            "          \"h\": 6,\n" +
            "          \"w\": 12,\n" +
            "          \"x\": 0,\n" +
            "          \"y\": 0\n" +
            "        },\n" +
            "        \"hiddenSeries\": false,\n" +
            "        \"id\": 16,\n" +
            "        \"legend\": {\n" +
            "          \"avg\": false,\n" +
            "          \"current\": false,\n" +
            "          \"max\": false,\n" +
            "          \"min\": false,\n" +
            "          \"show\": true,\n" +
            "          \"total\": false,\n" +
            "          \"values\": false\n" +
            "        },\n" +
            "        \"lines\": true,\n" +
            "        \"linewidth\": 1,\n" +
            "        \"nullPointMode\": \"null\",\n" +
            "        \"options\": {\n" +
            "          \"dataLinks\": []\n" +
            "        },\n" +
            "        \"percentage\": false,\n" +
            "        \"pointradius\": 2,\n" +
            "        \"points\": false,\n" +
            "        \"renderer\": \"flot\",\n" +
            "        \"seriesOverrides\": [],\n" +
            "        \"spaceLength\": 10,\n" +
            "        \"stack\": false,\n" +
            "        \"steppedLine\": false,\n" +
            "        \"targets\": [\n" +
            "          {\n" +
            "            \"groupBy\": [\n" +
            "              {\n" +
            "                \"params\": [\n" +
            "                  \"$__interval\"\n" +
            "                ],\n" +
            "                \"type\": \"time\"\n" +
            "              },\n" +
            "              {\n" +
            "                \"params\": [\n" +
            "                  \"null\"\n" +
            "                ],\n" +
            "                \"type\": \"fill\"\n" +
            "              }\n" +
            "            ],\n" +
            "            \"measurement\": \"counter\",\n" +
            "            \"orderByTime\": \"ASC\",\n" +
            "            \"policy\": \"default\",\n" +
            "            \"query\": \"SELECT mean(\\\"GcCount\\\") FROM \\\"counter\\\" WHERE (\\\"obj\\\" =~ /^$obj$/) AND $timeFilter GROUP BY time($__interval) fill(null)\",\n" +
            "            \"rawQuery\": false,\n" +
            "            \"refId\": \"A\",\n" +
            "            \"resultFormat\": \"time_series\",\n" +
            "            \"select\": [\n" +
            "              [\n" +
            "                {\n" +
            "                  \"params\": [\n" +
            "                    \"GcCount\"\n" +
            "                  ],\n" +
            "                  \"type\": \"field\"\n" +
            "                },\n" +
            "                {\n" +
            "                  \"params\": [],\n" +
            "                  \"type\": \"mean\"\n" +
            "                }\n" +
            "              ]\n" +
            "            ],\n" +
            "            \"tags\": [\n" +
            "              {\n" +
            "                \"key\": \"obj\",\n" +
            "                \"operator\": \"=~\",\n" +
            "                \"value\": \"/^$obj$/\"\n" +
            "              }\n" +
            "            ]\n" +
            "          }\n" +
            "        ],\n" +
            "        \"thresholds\": [],\n" +
            "        \"timeFrom\": null,\n" +
            "        \"timeRegions\": [],\n" +
            "        \"timeShift\": null,\n" +
            "        \"title\": \"GcCount\",\n" +
            "        \"tooltip\": {\n" +
            "          \"shared\": true,\n" +
            "          \"sort\": 0,\n" +
            "          \"value_type\": \"individual\"\n" +
            "        },\n" +
            "        \"type\": \"graph\",\n" +
            "        \"xaxis\": {\n" +
            "          \"buckets\": null,\n" +
            "          \"mode\": \"time\",\n" +
            "          \"name\": null,\n" +
            "          \"show\": true,\n" +
            "          \"values\": []\n" +
            "        },\n" +
            "        \"yaxes\": [\n" +
            "          {\n" +
            "            \"format\": \"short\",\n" +
            "            \"label\": null,\n" +
            "            \"logBase\": 1,\n" +
            "            \"max\": null,\n" +
            "            \"min\": null,\n" +
            "            \"show\": true\n" +
            "          },\n" +
            "          {\n" +
            "            \"format\": \"short\",\n" +
            "            \"label\": null,\n" +
            "            \"logBase\": 1,\n" +
            "            \"max\": null,\n" +
            "            \"min\": null,\n" +
            "            \"show\": true\n" +
            "          }\n" +
            "        ],\n" +
            "        \"yaxis\": {\n" +
            "          \"align\": false,\n" +
            "          \"alignLevel\": null\n" +
            "        }\n" +
            "      },\n" +
            "      {\n" +
            "        \"aliasColors\": {},\n" +
            "        \"bars\": false,\n" +
            "        \"dashLength\": 10,\n" +
            "        \"dashes\": false,\n" +
            "        \"datasource\": null,\n" +
            "        \"fill\": 1,\n" +
            "        \"fillGradient\": 0,\n" +
            "        \"gridPos\": {\n" +
            "          \"h\": 6,\n" +
            "          \"w\": 12,\n" +
            "          \"x\": 12,\n" +
            "          \"y\": 0\n" +
            "        },\n" +
            "        \"hiddenSeries\": false,\n" +
            "        \"id\": 10,\n" +
            "        \"legend\": {\n" +
            "          \"avg\": false,\n" +
            "          \"current\": false,\n" +
            "          \"max\": false,\n" +
            "          \"min\": false,\n" +
            "          \"show\": true,\n" +
            "          \"total\": false,\n" +
            "          \"values\": false\n" +
            "        },\n" +
            "        \"lines\": true,\n" +
            "        \"linewidth\": 1,\n" +
            "        \"nullPointMode\": \"null\",\n" +
            "        \"options\": {\n" +
            "          \"dataLinks\": []\n" +
            "        },\n" +
            "        \"percentage\": false,\n" +
            "        \"pointradius\": 2,\n" +
            "        \"points\": false,\n" +
            "        \"renderer\": \"flot\",\n" +
            "        \"seriesOverrides\": [],\n" +
            "        \"spaceLength\": 10,\n" +
            "        \"stack\": false,\n" +
            "        \"steppedLine\": false,\n" +
            "        \"targets\": [\n" +
            "          {\n" +
            "            \"groupBy\": [\n" +
            "              {\n" +
            "                \"params\": [\n" +
            "                  \"$__interval\"\n" +
            "                ],\n" +
            "                \"type\": \"time\"\n" +
            "              },\n" +
            "              {\n" +
            "                \"params\": [\n" +
            "                  \"null\"\n" +
            "                ],\n" +
            "                \"type\": \"fill\"\n" +
            "              }\n" +
            "            ],\n" +
            "            \"hide\": false,\n" +
            "            \"measurement\": \"counter\",\n" +
            "            \"orderByTime\": \"ASC\",\n" +
            "            \"policy\": \"default\",\n" +
            "            \"query\": \"SELECT mean(\\\"PermUsed\\\") FROM \\\"counter\\\" WHERE $timeFilter GROUP BY time($__interval) fill(null)\",\n" +
            "            \"rawQuery\": false,\n" +
            "            \"refId\": \"A\",\n" +
            "            \"resultFormat\": \"time_series\",\n" +
            "            \"select\": [\n" +
            "              [\n" +
            "                {\n" +
            "                  \"params\": [\n" +
            "                    \"PermUsed\"\n" +
            "                  ],\n" +
            "                  \"type\": \"field\"\n" +
            "                },\n" +
            "                {\n" +
            "                  \"params\": [],\n" +
            "                  \"type\": \"mean\"\n" +
            "                }\n" +
            "              ]\n" +
            "            ],\n" +
            "            \"tags\": [\n" +
            "              {\n" +
            "                \"key\": \"obj\",\n" +
            "                \"operator\": \"=~\",\n" +
            "                \"value\": \"/^$obj$/\"\n" +
            "              }\n" +
            "            ]\n" +
            "          }\n" +
            "        ],\n" +
            "        \"thresholds\": [],\n" +
            "        \"timeFrom\": null,\n" +
            "        \"timeRegions\": [],\n" +
            "        \"timeShift\": null,\n" +
            "        \"title\": \"PermUsed\",\n" +
            "        \"tooltip\": {\n" +
            "          \"shared\": true,\n" +
            "          \"sort\": 0,\n" +
            "          \"value_type\": \"individual\"\n" +
            "        },\n" +
            "        \"type\": \"graph\",\n" +
            "        \"xaxis\": {\n" +
            "          \"buckets\": null,\n" +
            "          \"mode\": \"time\",\n" +
            "          \"name\": null,\n" +
            "          \"show\": true,\n" +
            "          \"values\": []\n" +
            "        },\n" +
            "        \"yaxes\": [\n" +
            "          {\n" +
            "            \"$$hashKey\": \"object:376\",\n" +
            "            \"format\": \"short\",\n" +
            "            \"label\": null,\n" +
            "            \"logBase\": 1,\n" +
            "            \"max\": null,\n" +
            "            \"min\": null,\n" +
            "            \"show\": true\n" +
            "          },\n" +
            "          {\n" +
            "            \"$$hashKey\": \"object:377\",\n" +
            "            \"format\": \"short\",\n" +
            "            \"label\": null,\n" +
            "            \"logBase\": 1,\n" +
            "            \"max\": null,\n" +
            "            \"min\": null,\n" +
            "            \"show\": true\n" +
            "          }\n" +
            "        ],\n" +
            "        \"yaxis\": {\n" +
            "          \"align\": false,\n" +
            "          \"alignLevel\": null\n" +
            "        }\n" +
            "      },\n" +
            "      {\n" +
            "        \"aliasColors\": {},\n" +
            "        \"bars\": false,\n" +
            "        \"dashLength\": 10,\n" +
            "        \"dashes\": false,\n" +
            "        \"datasource\": null,\n" +
            "        \"fill\": 1,\n" +
            "        \"fillGradient\": 0,\n" +
            "        \"gridPos\": {\n" +
            "          \"h\": 6,\n" +
            "          \"w\": 12,\n" +
            "          \"x\": 0,\n" +
            "          \"y\": 6\n" +
            "        },\n" +
            "        \"hiddenSeries\": false,\n" +
            "        \"id\": 4,\n" +
            "        \"legend\": {\n" +
            "          \"avg\": false,\n" +
            "          \"current\": false,\n" +
            "          \"max\": false,\n" +
            "          \"min\": false,\n" +
            "          \"show\": true,\n" +
            "          \"total\": false,\n" +
            "          \"values\": false\n" +
            "        },\n" +
            "        \"lines\": true,\n" +
            "        \"linewidth\": 1,\n" +
            "        \"nullPointMode\": \"null\",\n" +
            "        \"options\": {\n" +
            "          \"dataLinks\": []\n" +
            "        },\n" +
            "        \"percentage\": false,\n" +
            "        \"pointradius\": 2,\n" +
            "        \"points\": false,\n" +
            "        \"renderer\": \"flot\",\n" +
            "        \"seriesOverrides\": [],\n" +
            "        \"spaceLength\": 10,\n" +
            "        \"stack\": false,\n" +
            "        \"steppedLine\": false,\n" +
            "        \"targets\": [\n" +
            "          {\n" +
            "            \"groupBy\": [\n" +
            "              {\n" +
            "                \"params\": [\n" +
            "                  \"$__interval\"\n" +
            "                ],\n" +
            "                \"type\": \"time\"\n" +
            "              },\n" +
            "              {\n" +
            "                \"params\": [\n" +
            "                  \"null\"\n" +
            "                ],\n" +
            "                \"type\": \"fill\"\n" +
            "              }\n" +
            "            ],\n" +
            "            \"measurement\": \"counter\",\n" +
            "            \"orderByTime\": \"ASC\",\n" +
            "            \"policy\": \"default\",\n" +
            "            \"query\": \"SELECT  mean(\\\"GcTime\\\") AS \\\"mean_GcTime\\\" FROM \\\"scouterCounter\\\".\\\"default\\\".\\\"counter\\\"  WHERE $timeFilter GROUP BY time($__interval) fill(null)\",\n" +
            "            \"rawQuery\": false,\n" +
            "            \"refId\": \"A\",\n" +
            "            \"resultFormat\": \"time_series\",\n" +
            "            \"select\": [\n" +
            "              [\n" +
            "                {\n" +
            "                  \"params\": [\n" +
            "                    \"GcTime\"\n" +
            "                  ],\n" +
            "                  \"type\": \"field\"\n" +
            "                },\n" +
            "                {\n" +
            "                  \"params\": [],\n" +
            "                  \"type\": \"mean\"\n" +
            "                }\n" +
            "              ]\n" +
            "            ],\n" +
            "            \"tags\": [\n" +
            "              {\n" +
            "                \"key\": \"obj\",\n" +
            "                \"operator\": \"=~\",\n" +
            "                \"value\": \"/^$obj$/\"\n" +
            "              }\n" +
            "            ]\n" +
            "          }\n" +
            "        ],\n" +
            "        \"thresholds\": [],\n" +
            "        \"timeFrom\": null,\n" +
            "        \"timeRegions\": [],\n" +
            "        \"timeShift\": null,\n" +
            "        \"title\": \"GcTime\",\n" +
            "        \"tooltip\": {\n" +
            "          \"shared\": true,\n" +
            "          \"sort\": 0,\n" +
            "          \"value_type\": \"individual\"\n" +
            "        },\n" +
            "        \"type\": \"graph\",\n" +
            "        \"xaxis\": {\n" +
            "          \"buckets\": null,\n" +
            "          \"mode\": \"time\",\n" +
            "          \"name\": null,\n" +
            "          \"show\": true,\n" +
            "          \"values\": []\n" +
            "        },\n" +
            "        \"yaxes\": [\n" +
            "          {\n" +
            "            \"$$hashKey\": \"object:507\",\n" +
            "            \"format\": \"short\",\n" +
            "            \"label\": null,\n" +
            "            \"logBase\": 1,\n" +
            "            \"max\": null,\n" +
            "            \"min\": null,\n" +
            "            \"show\": true\n" +
            "          },\n" +
            "          {\n" +
            "            \"$$hashKey\": \"object:508\",\n" +
            "            \"format\": \"short\",\n" +
            "            \"label\": null,\n" +
            "            \"logBase\": 1,\n" +
            "            \"max\": null,\n" +
            "            \"min\": null,\n" +
            "            \"show\": true\n" +
            "          }\n" +
            "        ],\n" +
            "        \"yaxis\": {\n" +
            "          \"align\": false,\n" +
            "          \"alignLevel\": null\n" +
            "        }\n" +
            "      },\n" +
            "      {\n" +
            "        \"aliasColors\": {},\n" +
            "        \"bars\": false,\n" +
            "        \"dashLength\": 10,\n" +
            "        \"dashes\": false,\n" +
            "        \"datasource\": null,\n" +
            "        \"fill\": 1,\n" +
            "        \"fillGradient\": 0,\n" +
            "        \"gridPos\": {\n" +
            "          \"h\": 6,\n" +
            "          \"w\": 12,\n" +
            "          \"x\": 12,\n" +
            "          \"y\": 6\n" +
            "        },\n" +
            "        \"hiddenSeries\": false,\n" +
            "        \"id\": 14,\n" +
            "        \"legend\": {\n" +
            "          \"avg\": false,\n" +
            "          \"current\": false,\n" +
            "          \"max\": false,\n" +
            "          \"min\": false,\n" +
            "          \"show\": true,\n" +
            "          \"total\": false,\n" +
            "          \"values\": false\n" +
            "        },\n" +
            "        \"lines\": true,\n" +
            "        \"linewidth\": 1,\n" +
            "        \"nullPointMode\": \"null\",\n" +
            "        \"options\": {\n" +
            "          \"dataLinks\": []\n" +
            "        },\n" +
            "        \"percentage\": false,\n" +
            "        \"pointradius\": 2,\n" +
            "        \"points\": false,\n" +
            "        \"renderer\": \"flot\",\n" +
            "        \"seriesOverrides\": [],\n" +
            "        \"spaceLength\": 10,\n" +
            "        \"stack\": false,\n" +
            "        \"steppedLine\": false,\n" +
            "        \"targets\": [\n" +
            "          {\n" +
            "            \"groupBy\": [\n" +
            "              {\n" +
            "                \"params\": [\n" +
            "                  \"$__interval\"\n" +
            "                ],\n" +
            "                \"type\": \"time\"\n" +
            "              },\n" +
            "              {\n" +
            "                \"params\": [\n" +
            "                  \"0\"\n" +
            "                ],\n" +
            "                \"type\": \"fill\"\n" +
            "              }\n" +
            "            ],\n" +
            "            \"measurement\": \"counter\",\n" +
            "            \"orderByTime\": \"ASC\",\n" +
            "            \"policy\": \"default\",\n" +
            "            \"query\": \"SELECT mean(\\\"TPS\\\") FROM \\\"counter\\\" WHERE $timeFilter GROUP BY time($__interval) fill(0)\",\n" +
            "            \"rawQuery\": false,\n" +
            "            \"refId\": \"A\",\n" +
            "            \"resultFormat\": \"time_series\",\n" +
            "            \"select\": [\n" +
            "              [\n" +
            "                {\n" +
            "                  \"params\": [\n" +
            "                    \"TPS\"\n" +
            "                  ],\n" +
            "                  \"type\": \"field\"\n" +
            "                },\n" +
            "                {\n" +
            "                  \"params\": [],\n" +
            "                  \"type\": \"mean\"\n" +
            "                }\n" +
            "              ]\n" +
            "            ],\n" +
            "            \"tags\": [\n" +
            "              {\n" +
            "                \"key\": \"obj\",\n" +
            "                \"operator\": \"=~\",\n" +
            "                \"value\": \"/^$obj$/\"\n" +
            "              }\n" +
            "            ]\n" +
            "          }\n" +
            "        ],\n" +
            "        \"thresholds\": [],\n" +
            "        \"timeFrom\": null,\n" +
            "        \"timeRegions\": [],\n" +
            "        \"timeShift\": null,\n" +
            "        \"title\": \"TPS\",\n" +
            "        \"tooltip\": {\n" +
            "          \"shared\": true,\n" +
            "          \"sort\": 0,\n" +
            "          \"value_type\": \"individual\"\n" +
            "        },\n" +
            "        \"type\": \"graph\",\n" +
            "        \"xaxis\": {\n" +
            "          \"buckets\": null,\n" +
            "          \"mode\": \"time\",\n" +
            "          \"name\": null,\n" +
            "          \"show\": true,\n" +
            "          \"values\": []\n" +
            "        },\n" +
            "        \"yaxes\": [\n" +
            "          {\n" +
            "            \"format\": \"short\",\n" +
            "            \"label\": null,\n" +
            "            \"logBase\": 1,\n" +
            "            \"max\": null,\n" +
            "            \"min\": null,\n" +
            "            \"show\": true\n" +
            "          },\n" +
            "          {\n" +
            "            \"format\": \"short\",\n" +
            "            \"label\": null,\n" +
            "            \"logBase\": 1,\n" +
            "            \"max\": null,\n" +
            "            \"min\": null,\n" +
            "            \"show\": true\n" +
            "          }\n" +
            "        ],\n" +
            "        \"yaxis\": {\n" +
            "          \"align\": false,\n" +
            "          \"alignLevel\": null\n" +
            "        }\n" +
            "      },\n" +
            "      {\n" +
            "        \"aliasColors\": {},\n" +
            "        \"bars\": false,\n" +
            "        \"dashLength\": 10,\n" +
            "        \"dashes\": false,\n" +
            "        \"datasource\": null,\n" +
            "        \"fill\": 1,\n" +
            "        \"fillGradient\": 0,\n" +
            "        \"gridPos\": {\n" +
            "          \"h\": 6,\n" +
            "          \"w\": 12,\n" +
            "          \"x\": 0,\n" +
            "          \"y\": 12\n" +
            "        },\n" +
            "        \"hiddenSeries\": false,\n" +
            "        \"id\": 6,\n" +
            "        \"legend\": {\n" +
            "          \"avg\": false,\n" +
            "          \"current\": false,\n" +
            "          \"max\": false,\n" +
            "          \"min\": false,\n" +
            "          \"show\": true,\n" +
            "          \"total\": false,\n" +
            "          \"values\": false\n" +
            "        },\n" +
            "        \"lines\": true,\n" +
            "        \"linewidth\": 1,\n" +
            "        \"nullPointMode\": \"null\",\n" +
            "        \"options\": {\n" +
            "          \"dataLinks\": []\n" +
            "        },\n" +
            "        \"percentage\": false,\n" +
            "        \"pointradius\": 2,\n" +
            "        \"points\": false,\n" +
            "        \"renderer\": \"flot\",\n" +
            "        \"seriesOverrides\": [],\n" +
            "        \"spaceLength\": 10,\n" +
            "        \"stack\": false,\n" +
            "        \"steppedLine\": false,\n" +
            "        \"targets\": [\n" +
            "          {\n" +
            "            \"groupBy\": [\n" +
            "              {\n" +
            "                \"params\": [\n" +
            "                  \"$__interval\"\n" +
            "                ],\n" +
            "                \"type\": \"time\"\n" +
            "              },\n" +
            "              {\n" +
            "                \"params\": [\n" +
            "                  \"null\"\n" +
            "                ],\n" +
            "                \"type\": \"fill\"\n" +
            "              }\n" +
            "            ],\n" +
            "            \"measurement\": \"counter\",\n" +
            "            \"orderByTime\": \"ASC\",\n" +
            "            \"policy\": \"default\",\n" +
            "            \"query\": \"SELECT mean(\\\"HeapUsed\\\") AS \\\"mean_HeapUsed\\\" FROM \\\"scouterCounter\\\".\\\"default\\\".\\\"counter\\\"  WHERE $timeFilter GROUP BY time($__interval) fill(null)\",\n" +
            "            \"rawQuery\": false,\n" +
            "            \"refId\": \"A\",\n" +
            "            \"resultFormat\": \"time_series\",\n" +
            "            \"select\": [\n" +
            "              [\n" +
            "                {\n" +
            "                  \"params\": [\n" +
            "                    \"HeapUsed\"\n" +
            "                  ],\n" +
            "                  \"type\": \"field\"\n" +
            "                },\n" +
            "                {\n" +
            "                  \"params\": [],\n" +
            "                  \"type\": \"mean\"\n" +
            "                }\n" +
            "              ]\n" +
            "            ],\n" +
            "            \"tags\": [\n" +
            "              {\n" +
            "                \"key\": \"obj\",\n" +
            "                \"operator\": \"=~\",\n" +
            "                \"value\": \"/^$obj$/\"\n" +
            "              }\n" +
            "            ]\n" +
            "          }\n" +
            "        ],\n" +
            "        \"thresholds\": [],\n" +
            "        \"timeFrom\": null,\n" +
            "        \"timeRegions\": [],\n" +
            "        \"timeShift\": null,\n" +
            "        \"title\": \"HeapUsed\",\n" +
            "        \"tooltip\": {\n" +
            "          \"shared\": true,\n" +
            "          \"sort\": 0,\n" +
            "          \"value_type\": \"individual\"\n" +
            "        },\n" +
            "        \"type\": \"graph\",\n" +
            "        \"xaxis\": {\n" +
            "          \"buckets\": null,\n" +
            "          \"mode\": \"time\",\n" +
            "          \"name\": null,\n" +
            "          \"show\": true,\n" +
            "          \"values\": []\n" +
            "        },\n" +
            "        \"yaxes\": [\n" +
            "          {\n" +
            "            \"format\": \"short\",\n" +
            "            \"label\": null,\n" +
            "            \"logBase\": 1,\n" +
            "            \"max\": null,\n" +
            "            \"min\": null,\n" +
            "            \"show\": true\n" +
            "          },\n" +
            "          {\n" +
            "            \"format\": \"short\",\n" +
            "            \"label\": null,\n" +
            "            \"logBase\": 1,\n" +
            "            \"max\": null,\n" +
            "            \"min\": null,\n" +
            "            \"show\": true\n" +
            "          }\n" +
            "        ],\n" +
            "        \"yaxis\": {\n" +
            "          \"align\": false,\n" +
            "          \"alignLevel\": null\n" +
            "        }\n" +
            "      },\n" +
            "      {\n" +
            "        \"aliasColors\": {},\n" +
            "        \"bars\": false,\n" +
            "        \"dashLength\": 10,\n" +
            "        \"dashes\": false,\n" +
            "        \"datasource\": null,\n" +
            "        \"fill\": 1,\n" +
            "        \"fillGradient\": 0,\n" +
            "        \"gridPos\": {\n" +
            "          \"h\": 6,\n" +
            "          \"w\": 12,\n" +
            "          \"x\": 12,\n" +
            "          \"y\": 12\n" +
            "        },\n" +
            "        \"hiddenSeries\": false,\n" +
            "        \"id\": 8,\n" +
            "        \"legend\": {\n" +
            "          \"avg\": false,\n" +
            "          \"current\": false,\n" +
            "          \"max\": false,\n" +
            "          \"min\": false,\n" +
            "          \"show\": true,\n" +
            "          \"total\": false,\n" +
            "          \"values\": false\n" +
            "        },\n" +
            "        \"lines\": true,\n" +
            "        \"linewidth\": 1,\n" +
            "        \"nullPointMode\": \"null\",\n" +
            "        \"options\": {\n" +
            "          \"dataLinks\": []\n" +
            "        },\n" +
            "        \"percentage\": false,\n" +
            "        \"pointradius\": 2,\n" +
            "        \"points\": false,\n" +
            "        \"renderer\": \"flot\",\n" +
            "        \"seriesOverrides\": [],\n" +
            "        \"spaceLength\": 10,\n" +
            "        \"stack\": false,\n" +
            "        \"steppedLine\": false,\n" +
            "        \"targets\": [\n" +
            "          {\n" +
            "            \"groupBy\": [\n" +
            "              {\n" +
            "                \"params\": [\n" +
            "                  \"$__interval\"\n" +
            "                ],\n" +
            "                \"type\": \"time\"\n" +
            "              },\n" +
            "              {\n" +
            "                \"params\": [\n" +
            "                  \"null\"\n" +
            "                ],\n" +
            "                \"type\": \"fill\"\n" +
            "              }\n" +
            "            ],\n" +
            "            \"measurement\": \"counter\",\n" +
            "            \"orderByTime\": \"ASC\",\n" +
            "            \"policy\": \"default\",\n" +
            "            \"query\": \"SELECT mean(\\\"ServiceCount\\\") AS \\\"mean_ServiceCount\\\", mean(\\\"SqlErrorRate\\\") AS \\\"mean_SqlErrorRate\\\", mean(\\\"SqlTPS\\\") AS \\\"mean_SqlTPS\\\", mean(\\\"SqlTime\\\") AS \\\"mean_SqlTime\\\", mean(\\\"SqlTimeByService\\\") AS \\\"mean_SqlTimeByService\\\", mean(\\\"TPS\\\") AS \\\"mean_TPS\\\" FROM \\\"scouterCounter\\\".\\\"default\\\".\\\"counter\\\"  WHERE $timeFilter GROUP BY time($__interval) fill(null)\",\n" +
            "            \"rawQuery\": false,\n" +
            "            \"refId\": \"A\",\n" +
            "            \"resultFormat\": \"time_series\",\n" +
            "            \"select\": [\n" +
            "              [\n" +
            "                {\n" +
            "                  \"params\": [\n" +
            "                    \"ServiceCount\"\n" +
            "                  ],\n" +
            "                  \"type\": \"field\"\n" +
            "                },\n" +
            "                {\n" +
            "                  \"params\": [],\n" +
            "                  \"type\": \"mean\"\n" +
            "                }\n" +
            "              ]\n" +
            "            ],\n" +
            "            \"tags\": [\n" +
            "              {\n" +
            "                \"key\": \"obj\",\n" +
            "                \"operator\": \"=~\",\n" +
            "                \"value\": \"/^$obj$/\"\n" +
            "              }\n" +
            "            ]\n" +
            "          }\n" +
            "        ],\n" +
            "        \"thresholds\": [],\n" +
            "        \"timeFrom\": null,\n" +
            "        \"timeRegions\": [],\n" +
            "        \"timeShift\": null,\n" +
            "        \"title\": \"Service Monitor\",\n" +
            "        \"tooltip\": {\n" +
            "          \"shared\": true,\n" +
            "          \"sort\": 0,\n" +
            "          \"value_type\": \"individual\"\n" +
            "        },\n" +
            "        \"type\": \"graph\",\n" +
            "        \"xaxis\": {\n" +
            "          \"buckets\": null,\n" +
            "          \"mode\": \"time\",\n" +
            "          \"name\": null,\n" +
            "          \"show\": true,\n" +
            "          \"values\": []\n" +
            "        },\n" +
            "        \"yaxes\": [\n" +
            "          {\n" +
            "            \"format\": \"short\",\n" +
            "            \"label\": null,\n" +
            "            \"logBase\": 1,\n" +
            "            \"max\": null,\n" +
            "            \"min\": null,\n" +
            "            \"show\": true\n" +
            "          },\n" +
            "          {\n" +
            "            \"format\": \"short\",\n" +
            "            \"label\": null,\n" +
            "            \"logBase\": 1,\n" +
            "            \"max\": null,\n" +
            "            \"min\": null,\n" +
            "            \"show\": true\n" +
            "          }\n" +
            "        ],\n" +
            "        \"yaxis\": {\n" +
            "          \"align\": false,\n" +
            "          \"alignLevel\": null\n" +
            "        }\n" +
            "      },\n" +
            "      {\n" +
            "        \"aliasColors\": {},\n" +
            "        \"bars\": false,\n" +
            "        \"dashLength\": 10,\n" +
            "        \"dashes\": false,\n" +
            "        \"datasource\": null,\n" +
            "        \"fill\": 1,\n" +
            "        \"fillGradient\": 0,\n" +
            "        \"gridPos\": {\n" +
            "          \"h\": 6,\n" +
            "          \"w\": 12,\n" +
            "          \"x\": 0,\n" +
            "          \"y\": 18\n" +
            "        },\n" +
            "        \"hiddenSeries\": false,\n" +
            "        \"id\": 12,\n" +
            "        \"legend\": {\n" +
            "          \"avg\": false,\n" +
            "          \"current\": false,\n" +
            "          \"max\": false,\n" +
            "          \"min\": false,\n" +
            "          \"show\": true,\n" +
            "          \"total\": false,\n" +
            "          \"values\": false\n" +
            "        },\n" +
            "        \"lines\": true,\n" +
            "        \"linewidth\": 1,\n" +
            "        \"nullPointMode\": \"null\",\n" +
            "        \"options\": {\n" +
            "          \"dataLinks\": []\n" +
            "        },\n" +
            "        \"percentage\": false,\n" +
            "        \"pointradius\": 2,\n" +
            "        \"points\": false,\n" +
            "        \"renderer\": \"flot\",\n" +
            "        \"seriesOverrides\": [],\n" +
            "        \"spaceLength\": 10,\n" +
            "        \"stack\": false,\n" +
            "        \"steppedLine\": false,\n" +
            "        \"targets\": [\n" +
            "          {\n" +
            "            \"groupBy\": [\n" +
            "              {\n" +
            "                \"params\": [\n" +
            "                  \"$__interval\"\n" +
            "                ],\n" +
            "                \"type\": \"time\"\n" +
            "              },\n" +
            "              {\n" +
            "                \"params\": [\n" +
            "                  \"null\"\n" +
            "                ],\n" +
            "                \"type\": \"fill\"\n" +
            "              }\n" +
            "            ],\n" +
            "            \"measurement\": \"counter\",\n" +
            "            \"orderByTime\": \"ASC\",\n" +
            "            \"policy\": \"default\",\n" +
            "            \"query\": \"SELECT mean(\\\"HeapTotal\\\") FROM \\\"counter\\\" AND $timeFilter GROUP BY time($__interval) fill(null)\",\n" +
            "            \"rawQuery\": false,\n" +
            "            \"refId\": \"A\",\n" +
            "            \"resultFormat\": \"time_series\",\n" +
            "            \"select\": [\n" +
            "              [\n" +
            "                {\n" +
            "                  \"params\": [\n" +
            "                    \"HeapTotal\"\n" +
            "                  ],\n" +
            "                  \"type\": \"field\"\n" +
            "                },\n" +
            "                {\n" +
            "                  \"params\": [],\n" +
            "                  \"type\": \"mean\"\n" +
            "                }\n" +
            "              ]\n" +
            "            ],\n" +
            "            \"tags\": [\n" +
            "              {\n" +
            "                \"key\": \"obj\",\n" +
            "                \"operator\": \"=~\",\n" +
            "                \"value\": \"/^$obj$/\"\n" +
            "              }\n" +
            "            ]\n" +
            "          }\n" +
            "        ],\n" +
            "        \"thresholds\": [],\n" +
            "        \"timeFrom\": null,\n" +
            "        \"timeRegions\": [],\n" +
            "        \"timeShift\": null,\n" +
            "        \"title\": \"HeapTotal\",\n" +
            "        \"tooltip\": {\n" +
            "          \"shared\": true,\n" +
            "          \"sort\": 0,\n" +
            "          \"value_type\": \"individual\"\n" +
            "        },\n" +
            "        \"type\": \"graph\",\n" +
            "        \"xaxis\": {\n" +
            "          \"buckets\": null,\n" +
            "          \"mode\": \"time\",\n" +
            "          \"name\": null,\n" +
            "          \"show\": true,\n" +
            "          \"values\": []\n" +
            "        },\n" +
            "        \"yaxes\": [\n" +
            "          {\n" +
            "            \"$$hashKey\": \"object:115\",\n" +
            "            \"format\": \"short\",\n" +
            "            \"label\": null,\n" +
            "            \"logBase\": 1,\n" +
            "            \"max\": null,\n" +
            "            \"min\": null,\n" +
            "            \"show\": true\n" +
            "          },\n" +
            "          {\n" +
            "            \"$$hashKey\": \"object:116\",\n" +
            "            \"format\": \"short\",\n" +
            "            \"label\": null,\n" +
            "            \"logBase\": 1,\n" +
            "            \"max\": null,\n" +
            "            \"min\": null,\n" +
            "            \"show\": true\n" +
            "          }\n" +
            "        ],\n" +
            "        \"yaxis\": {\n" +
            "          \"align\": false,\n" +
            "          \"alignLevel\": null\n" +
            "        }\n" +
            "      },\n" +
            "      {\n" +
            "        \"aliasColors\": {},\n" +
            "        \"bars\": false,\n" +
            "        \"dashLength\": 10,\n" +
            "        \"dashes\": false,\n" +
            "        \"datasource\": null,\n" +
            "        \"fill\": 1,\n" +
            "        \"fillGradient\": 0,\n" +
            "        \"gridPos\": {\n" +
            "          \"h\": 6,\n" +
            "          \"w\": 12,\n" +
            "          \"x\": 12,\n" +
            "          \"y\": 18\n" +
            "        },\n" +
            "        \"hiddenSeries\": false,\n" +
            "        \"id\": 2,\n" +
            "        \"legend\": {\n" +
            "          \"avg\": false,\n" +
            "          \"current\": false,\n" +
            "          \"max\": false,\n" +
            "          \"min\": false,\n" +
            "          \"show\": true,\n" +
            "          \"total\": false,\n" +
            "          \"values\": false\n" +
            "        },\n" +
            "        \"lines\": true,\n" +
            "        \"linewidth\": 1,\n" +
            "        \"nullPointMode\": \"null\",\n" +
            "        \"options\": {\n" +
            "          \"dataLinks\": []\n" +
            "        },\n" +
            "        \"percentage\": false,\n" +
            "        \"pointradius\": 2,\n" +
            "        \"points\": false,\n" +
            "        \"renderer\": \"flot\",\n" +
            "        \"seriesOverrides\": [],\n" +
            "        \"spaceLength\": 10,\n" +
            "        \"stack\": false,\n" +
            "        \"steppedLine\": false,\n" +
            "        \"targets\": [\n" +
            "          {\n" +
            "            \"groupBy\": [\n" +
            "              {\n" +
            "                \"params\": [\n" +
            "                  \"$__interval\"\n" +
            "                ],\n" +
            "                \"type\": \"time\"\n" +
            "              },\n" +
            "              {\n" +
            "                \"params\": [\n" +
            "                  \"null\"\n" +
            "                ],\n" +
            "                \"type\": \"fill\"\n" +
            "              }\n" +
            "            ],\n" +
            "            \"measurement\": \"counter\",\n" +
            "            \"orderByTime\": \"ASC\",\n" +
            "            \"policy\": \"default\",\n" +
            "            \"query\": \"SELECT mean(\\\"ElapsedTime\\\") AS \\\"mean_ElapsedTime\\\" FROM \\\"scouterCounter\\\".\\\"default\\\".\\\"counter\\\"  WHERE $timeFilter GROUP BY time($__interval) fill(null)\",\n" +
            "            \"rawQuery\": false,\n" +
            "            \"refId\": \"A\",\n" +
            "            \"resultFormat\": \"time_series\",\n" +
            "            \"select\": [\n" +
            "              [\n" +
            "                {\n" +
            "                  \"params\": [\n" +
            "                    \"ElapsedTime\"\n" +
            "                  ],\n" +
            "                  \"type\": \"field\"\n" +
            "                },\n" +
            "                {\n" +
            "                  \"params\": [],\n" +
            "                  \"type\": \"mean\"\n" +
            "                }\n" +
            "              ]\n" +
            "            ],\n" +
            "            \"tags\": [\n" +
            "              {\n" +
            "                \"key\": \"obj\",\n" +
            "                \"operator\": \"=~\",\n" +
            "                \"value\": \"/^$obj$/\"\n" +
            "              }\n" +
            "            ]\n" +
            "          }\n" +
            "        ],\n" +
            "        \"thresholds\": [],\n" +
            "        \"timeFrom\": null,\n" +
            "        \"timeRegions\": [],\n" +
            "        \"timeShift\": null,\n" +
            "        \"title\": \"ElapsedTime\",\n" +
            "        \"tooltip\": {\n" +
            "          \"shared\": true,\n" +
            "          \"sort\": 0,\n" +
            "          \"value_type\": \"individual\"\n" +
            "        },\n" +
            "        \"type\": \"graph\",\n" +
            "        \"xaxis\": {\n" +
            "          \"buckets\": null,\n" +
            "          \"mode\": \"time\",\n" +
            "          \"name\": null,\n" +
            "          \"show\": true,\n" +
            "          \"values\": []\n" +
            "        },\n" +
            "        \"yaxes\": [\n" +
            "          {\n" +
            "            \"$$hashKey\": \"object:394\",\n" +
            "            \"format\": \"short\",\n" +
            "            \"label\": null,\n" +
            "            \"logBase\": 1,\n" +
            "            \"max\": null,\n" +
            "            \"min\": null,\n" +
            "            \"show\": true\n" +
            "          },\n" +
            "          {\n" +
            "            \"$$hashKey\": \"object:395\",\n" +
            "            \"format\": \"short\",\n" +
            "            \"label\": null,\n" +
            "            \"logBase\": 1,\n" +
            "            \"max\": null,\n" +
            "            \"min\": null,\n" +
            "            \"show\": true\n" +
            "          }\n" +
            "        ],\n" +
            "        \"yaxis\": {\n" +
            "          \"align\": false,\n" +
            "          \"alignLevel\": null\n" +
            "        }\n" +
            "      },\n" +
            "      {\n" +
            "        \"aliasColors\": {},\n" +
            "        \"bars\": false,\n" +
            "        \"dashLength\": 10,\n" +
            "        \"dashes\": false,\n" +
            "        \"datasource\": \"Elasticsearch - Topbeat\",\n" +
            "        \"fill\": 1,\n" +
            "        \"fillGradient\": 0,\n" +
            "        \"gridPos\": {\n" +
            "          \"h\": 6,\n" +
            "          \"w\": 12,\n" +
            "          \"x\": 0,\n" +
            "          \"y\": 24\n" +
            "        },\n" +
            "        \"hiddenSeries\": false,\n" +
            "        \"id\": 26,\n" +
            "        \"legend\": {\n" +
            "          \"avg\": false,\n" +
            "          \"current\": false,\n" +
            "          \"max\": false,\n" +
            "          \"min\": false,\n" +
            "          \"show\": true,\n" +
            "          \"total\": false,\n" +
            "          \"values\": false\n" +
            "        },\n" +
            "        \"lines\": true,\n" +
            "        \"linewidth\": 1,\n" +
            "        \"nullPointMode\": \"null\",\n" +
            "        \"options\": {\n" +
            "          \"dataLinks\": []\n" +
            "        },\n" +
            "        \"percentage\": false,\n" +
            "        \"pointradius\": 2,\n" +
            "        \"points\": false,\n" +
            "        \"renderer\": \"flot\",\n" +
            "        \"seriesOverrides\": [],\n" +
            "        \"spaceLength\": 10,\n" +
            "        \"stack\": false,\n" +
            "        \"steppedLine\": false,\n" +
            "        \"targets\": [\n" +
            "          {\n" +
            "            \"bucketAggs\": [\n" +
            "              {\n" +
            "                \"$$hashKey\": \"object:1129\",\n" +
            "                \"field\": \"@timestamp\",\n" +
            "                \"id\": \"2\",\n" +
            "                \"settings\": {\n" +
            "                  \"interval\": \"auto\",\n" +
            "                  \"min_doc_count\": 0,\n" +
            "                  \"trimEdges\": 0\n" +
            "                },\n" +
            "                \"type\": \"date_histogram\"\n" +
            "              }\n" +
            "            ],\n" +
            "            \"metrics\": [\n" +
            "              {\n" +
            "                \"$$hashKey\": \"object:1127\",\n" +
            "                \"field\": \"select field\",\n" +
            "                \"id\": \"1\",\n" +
            "                \"type\": \"count\"\n" +
            "              }\n" +
            "            ],\n" +
            "            \"query\": \"beat.hostname : $thostname\",\n" +
            "            \"refId\": \"A\",\n" +
            "            \"timeField\": \"@timestamp\"\n" +
            "          }\n" +
            "        ],\n" +
            "        \"thresholds\": [],\n" +
            "        \"timeFrom\": null,\n" +
            "        \"timeRegions\": [],\n" +
            "        \"timeShift\": null,\n" +
            "        \"title\": \"TopBeat\",\n" +
            "        \"tooltip\": {\n" +
            "          \"shared\": true,\n" +
            "          \"sort\": 0,\n" +
            "          \"value_type\": \"individual\"\n" +
            "        },\n" +
            "        \"type\": \"graph\",\n" +
            "        \"xaxis\": {\n" +
            "          \"buckets\": null,\n" +
            "          \"mode\": \"time\",\n" +
            "          \"name\": null,\n" +
            "          \"show\": true,\n" +
            "          \"values\": []\n" +
            "        },\n" +
            "        \"yaxes\": [\n" +
            "          {\n" +
            "            \"format\": \"short\",\n" +
            "            \"label\": null,\n" +
            "            \"logBase\": 1,\n" +
            "            \"max\": null,\n" +
            "            \"min\": null,\n" +
            "            \"show\": true\n" +
            "          },\n" +
            "          {\n" +
            "            \"format\": \"short\",\n" +
            "            \"label\": null,\n" +
            "            \"logBase\": 1,\n" +
            "            \"max\": null,\n" +
            "            \"min\": null,\n" +
            "            \"show\": true\n" +
            "          }\n" +
            "        ],\n" +
            "        \"yaxis\": {\n" +
            "          \"align\": false,\n" +
            "          \"alignLevel\": null\n" +
            "        }\n" +
            "      },\n" +
            "      {\n" +
            "        \"aliasColors\": {},\n" +
            "        \"bars\": false,\n" +
            "        \"dashLength\": 10,\n" +
            "        \"dashes\": false,\n" +
            "        \"datasource\": \"Elasticsearch - Metricbeat\",\n" +
            "        \"fill\": 1,\n" +
            "        \"fillGradient\": 0,\n" +
            "        \"gridPos\": {\n" +
            "          \"h\": 6,\n" +
            "          \"w\": 12,\n" +
            "          \"x\": 12,\n" +
            "          \"y\": 24\n" +
            "        },\n" +
            "        \"hiddenSeries\": false,\n" +
            "        \"id\": 22,\n" +
            "        \"legend\": {\n" +
            "          \"avg\": false,\n" +
            "          \"current\": false,\n" +
            "          \"max\": false,\n" +
            "          \"min\": false,\n" +
            "          \"show\": true,\n" +
            "          \"total\": false,\n" +
            "          \"values\": false\n" +
            "        },\n" +
            "        \"lines\": true,\n" +
            "        \"linewidth\": 1,\n" +
            "        \"nullPointMode\": \"null\",\n" +
            "        \"options\": {\n" +
            "          \"dataLinks\": []\n" +
            "        },\n" +
            "        \"percentage\": false,\n" +
            "        \"pointradius\": 2,\n" +
            "        \"points\": false,\n" +
            "        \"renderer\": \"flot\",\n" +
            "        \"seriesOverrides\": [],\n" +
            "        \"spaceLength\": 10,\n" +
            "        \"stack\": false,\n" +
            "        \"steppedLine\": false,\n" +
            "        \"targets\": [\n" +
            "          {\n" +
            "            \"bucketAggs\": [\n" +
            "              {\n" +
            "                \"$$hashKey\": \"object:1011\",\n" +
            "                \"field\": \"@timestamp\",\n" +
            "                \"id\": \"2\",\n" +
            "                \"settings\": {\n" +
            "                  \"interval\": \"auto\",\n" +
            "                  \"min_doc_count\": 0,\n" +
            "                  \"trimEdges\": 0\n" +
            "                },\n" +
            "                \"type\": \"date_histogram\"\n" +
            "              }\n" +
            "            ],\n" +
            "            \"metrics\": [\n" +
            "              {\n" +
            "                \"$$hashKey\": \"object:1009\",\n" +
            "                \"field\": \"select field\",\n" +
            "                \"id\": \"1\",\n" +
            "                \"type\": \"count\"\n" +
            "              }\n" +
            "            ],\n" +
            "            \"query\": \"agent.hostname : $mhostname\",\n" +
            "            \"refId\": \"A\",\n" +
            "            \"timeField\": \"@timestamp\"\n" +
            "          }\n" +
            "        ],\n" +
            "        \"thresholds\": [],\n" +
            "        \"timeFrom\": null,\n" +
            "        \"timeRegions\": [],\n" +
            "        \"timeShift\": null,\n" +
            "        \"title\": \"MetricBeat\",\n" +
            "        \"tooltip\": {\n" +
            "          \"shared\": true,\n" +
            "          \"sort\": 0,\n" +
            "          \"value_type\": \"individual\"\n" +
            "        },\n" +
            "        \"type\": \"graph\",\n" +
            "        \"xaxis\": {\n" +
            "          \"buckets\": null,\n" +
            "          \"mode\": \"time\",\n" +
            "          \"name\": null,\n" +
            "          \"show\": true,\n" +
            "          \"values\": []\n" +
            "        },\n" +
            "        \"yaxes\": [\n" +
            "          {\n" +
            "            \"format\": \"short\",\n" +
            "            \"label\": null,\n" +
            "            \"logBase\": 1,\n" +
            "            \"max\": null,\n" +
            "            \"min\": null,\n" +
            "            \"show\": true\n" +
            "          },\n" +
            "          {\n" +
            "            \"format\": \"short\",\n" +
            "            \"label\": null,\n" +
            "            \"logBase\": 1,\n" +
            "            \"max\": null,\n" +
            "            \"min\": null,\n" +
            "            \"show\": true\n" +
            "          }\n" +
            "        ],\n" +
            "        \"yaxis\": {\n" +
            "          \"align\": false,\n" +
            "          \"alignLevel\": null\n" +
            "        }\n" +
            "      },\n" +
            "      {\n" +
            "        \"aliasColors\": {},\n" +
            "        \"bars\": false,\n" +
            "        \"dashLength\": 10,\n" +
            "        \"dashes\": false,\n" +
            "        \"datasource\": \"Elasticsearch - Filebeat\",\n" +
            "        \"fill\": 1,\n" +
            "        \"fillGradient\": 0,\n" +
            "        \"gridPos\": {\n" +
            "          \"h\": 6,\n" +
            "          \"w\": 12,\n" +
            "          \"x\": 0,\n" +
            "          \"y\": 30\n" +
            "        },\n" +
            "        \"hiddenSeries\": false,\n" +
            "        \"id\": 18,\n" +
            "        \"legend\": {\n" +
            "          \"avg\": false,\n" +
            "          \"current\": false,\n" +
            "          \"max\": false,\n" +
            "          \"min\": false,\n" +
            "          \"show\": true,\n" +
            "          \"total\": false,\n" +
            "          \"values\": false\n" +
            "        },\n" +
            "        \"lines\": true,\n" +
            "        \"linewidth\": 1,\n" +
            "        \"nullPointMode\": \"null\",\n" +
            "        \"options\": {\n" +
            "          \"dataLinks\": []\n" +
            "        },\n" +
            "        \"percentage\": false,\n" +
            "        \"pointradius\": 2,\n" +
            "        \"points\": false,\n" +
            "        \"renderer\": \"flot\",\n" +
            "        \"seriesOverrides\": [],\n" +
            "        \"spaceLength\": 10,\n" +
            "        \"stack\": false,\n" +
            "        \"steppedLine\": false,\n" +
            "        \"targets\": [\n" +
            "          {\n" +
            "            \"bucketAggs\": [\n" +
            "              {\n" +
            "                \"$$hashKey\": \"object:709\",\n" +
            "                \"field\": \"@timestamp\",\n" +
            "                \"id\": \"2\",\n" +
            "                \"settings\": {\n" +
            "                  \"interval\": \"auto\",\n" +
            "                  \"min_doc_count\": 0,\n" +
            "                  \"trimEdges\": 0\n" +
            "                },\n" +
            "                \"type\": \"date_histogram\"\n" +
            "              }\n" +
            "            ],\n" +
            "            \"metrics\": [\n" +
            "              {\n" +
            "                \"$$hashKey\": \"object:707\",\n" +
            "                \"field\": \"select field\",\n" +
            "                \"id\": \"1\",\n" +
            "                \"type\": \"count\"\n" +
            "              }\n" +
            "            ],\n" +
            "            \"query\": \"agent.hostname : $fhostname\",\n" +
            "            \"refId\": \"A\",\n" +
            "            \"timeField\": \"@timestamp\"\n" +
            "          }\n" +
            "        ],\n" +
            "        \"thresholds\": [],\n" +
            "        \"timeFrom\": null,\n" +
            "        \"timeRegions\": [],\n" +
            "        \"timeShift\": null,\n" +
            "        \"title\": \"FileBeat\",\n" +
            "        \"tooltip\": {\n" +
            "          \"shared\": true,\n" +
            "          \"sort\": 0,\n" +
            "          \"value_type\": \"individual\"\n" +
            "        },\n" +
            "        \"type\": \"graph\",\n" +
            "        \"xaxis\": {\n" +
            "          \"buckets\": null,\n" +
            "          \"mode\": \"time\",\n" +
            "          \"name\": null,\n" +
            "          \"show\": true,\n" +
            "          \"values\": []\n" +
            "        },\n" +
            "        \"yaxes\": [\n" +
            "          {\n" +
            "            \"$$hashKey\": \"object:764\",\n" +
            "            \"format\": \"short\",\n" +
            "            \"label\": null,\n" +
            "            \"logBase\": 1,\n" +
            "            \"max\": null,\n" +
            "            \"min\": null,\n" +
            "            \"show\": true\n" +
            "          },\n" +
            "          {\n" +
            "            \"$$hashKey\": \"object:765\",\n" +
            "            \"format\": \"short\",\n" +
            "            \"label\": null,\n" +
            "            \"logBase\": 1,\n" +
            "            \"max\": null,\n" +
            "            \"min\": null,\n" +
            "            \"show\": true\n" +
            "          }\n" +
            "        ],\n" +
            "        \"yaxis\": {\n" +
            "          \"align\": false,\n" +
            "          \"alignLevel\": null\n" +
            "        }\n" +
            "      },\n" +
            "      {\n" +
            "        \"aliasColors\": {},\n" +
            "        \"bars\": false,\n" +
            "        \"dashLength\": 10,\n" +
            "        \"dashes\": false,\n" +
            "        \"datasource\": \"Elasticsearch - Heartbeat\",\n" +
            "        \"fill\": 1,\n" +
            "        \"fillGradient\": 0,\n" +
            "        \"gridPos\": {\n" +
            "          \"h\": 6,\n" +
            "          \"w\": 12,\n" +
            "          \"x\": 12,\n" +
            "          \"y\": 30\n" +
            "        },\n" +
            "        \"hiddenSeries\": false,\n" +
            "        \"id\": 20,\n" +
            "        \"legend\": {\n" +
            "          \"avg\": false,\n" +
            "          \"current\": false,\n" +
            "          \"max\": false,\n" +
            "          \"min\": false,\n" +
            "          \"show\": true,\n" +
            "          \"total\": false,\n" +
            "          \"values\": false\n" +
            "        },\n" +
            "        \"lines\": true,\n" +
            "        \"linewidth\": 1,\n" +
            "        \"nullPointMode\": \"null\",\n" +
            "        \"options\": {\n" +
            "          \"dataLinks\": []\n" +
            "        },\n" +
            "        \"percentage\": false,\n" +
            "        \"pointradius\": 2,\n" +
            "        \"points\": false,\n" +
            "        \"renderer\": \"flot\",\n" +
            "        \"seriesOverrides\": [],\n" +
            "        \"spaceLength\": 10,\n" +
            "        \"stack\": false,\n" +
            "        \"steppedLine\": false,\n" +
            "        \"targets\": [\n" +
            "          {\n" +
            "            \"bucketAggs\": [\n" +
            "              {\n" +
            "                \"$$hashKey\": \"object:881\",\n" +
            "                \"field\": \"@timestamp\",\n" +
            "                \"id\": \"2\",\n" +
            "                \"settings\": {\n" +
            "                  \"interval\": \"auto\",\n" +
            "                  \"min_doc_count\": 0,\n" +
            "                  \"trimEdges\": 0\n" +
            "                },\n" +
            "                \"type\": \"date_histogram\"\n" +
            "              }\n" +
            "            ],\n" +
            "            \"metrics\": [\n" +
            "              {\n" +
            "                \"$$hashKey\": \"object:879\",\n" +
            "                \"field\": \"select field\",\n" +
            "                \"id\": \"1\",\n" +
            "                \"type\": \"count\"\n" +
            "              }\n" +
            "            ],\n" +
            "            \"query\": \"agent.hostname : $hhostname\",\n" +
            "            \"refId\": \"A\",\n" +
            "            \"timeField\": \"@timestamp\"\n" +
            "          }\n" +
            "        ],\n" +
            "        \"thresholds\": [],\n" +
            "        \"timeFrom\": null,\n" +
            "        \"timeRegions\": [],\n" +
            "        \"timeShift\": null,\n" +
            "        \"title\": \"HeartBeat\",\n" +
            "        \"tooltip\": {\n" +
            "          \"shared\": true,\n" +
            "          \"sort\": 0,\n" +
            "          \"value_type\": \"individual\"\n" +
            "        },\n" +
            "        \"type\": \"graph\",\n" +
            "        \"xaxis\": {\n" +
            "          \"buckets\": null,\n" +
            "          \"mode\": \"time\",\n" +
            "          \"name\": null,\n" +
            "          \"show\": true,\n" +
            "          \"values\": []\n" +
            "        },\n" +
            "        \"yaxes\": [\n" +
            "          {\n" +
            "            \"$$hashKey\": \"object:936\",\n" +
            "            \"format\": \"short\",\n" +
            "            \"label\": null,\n" +
            "            \"logBase\": 1,\n" +
            "            \"max\": null,\n" +
            "            \"min\": null,\n" +
            "            \"show\": true\n" +
            "          },\n" +
            "          {\n" +
            "            \"$$hashKey\": \"object:937\",\n" +
            "            \"format\": \"short\",\n" +
            "            \"label\": null,\n" +
            "            \"logBase\": 1,\n" +
            "            \"max\": null,\n" +
            "            \"min\": null,\n" +
            "            \"show\": true\n" +
            "          }\n" +
            "        ],\n" +
            "        \"yaxis\": {\n" +
            "          \"align\": false,\n" +
            "          \"alignLevel\": null\n" +
            "        }\n" +
            "      },\n" +
            "      {\n" +
            "        \"aliasColors\": {},\n" +
            "        \"bars\": false,\n" +
            "        \"dashLength\": 10,\n" +
            "        \"dashes\": false,\n" +
            "        \"datasource\": \"Elasticsearch - Packetbeat\",\n" +
            "        \"fill\": 1,\n" +
            "        \"fillGradient\": 0,\n" +
            "        \"gridPos\": {\n" +
            "          \"h\": 6,\n" +
            "          \"w\": 12,\n" +
            "          \"x\": 0,\n" +
            "          \"y\": 36\n" +
            "        },\n" +
            "        \"hiddenSeries\": false,\n" +
            "        \"id\": 24,\n" +
            "        \"legend\": {\n" +
            "          \"avg\": false,\n" +
            "          \"current\": false,\n" +
            "          \"max\": false,\n" +
            "          \"min\": false,\n" +
            "          \"show\": true,\n" +
            "          \"total\": false,\n" +
            "          \"values\": false\n" +
            "        },\n" +
            "        \"lines\": true,\n" +
            "        \"linewidth\": 1,\n" +
            "        \"nullPointMode\": \"null\",\n" +
            "        \"options\": {\n" +
            "          \"dataLinks\": []\n" +
            "        },\n" +
            "        \"percentage\": false,\n" +
            "        \"pointradius\": 2,\n" +
            "        \"points\": false,\n" +
            "        \"renderer\": \"flot\",\n" +
            "        \"seriesOverrides\": [],\n" +
            "        \"spaceLength\": 10,\n" +
            "        \"stack\": false,\n" +
            "        \"steppedLine\": false,\n" +
            "        \"targets\": [\n" +
            "          {\n" +
            "            \"bucketAggs\": [\n" +
            "              {\n" +
            "                \"$$hashKey\": \"object:1070\",\n" +
            "                \"field\": \"@timestamp\",\n" +
            "                \"id\": \"2\",\n" +
            "                \"settings\": {\n" +
            "                  \"interval\": \"auto\",\n" +
            "                  \"min_doc_count\": 0,\n" +
            "                  \"trimEdges\": 0\n" +
            "                },\n" +
            "                \"type\": \"date_histogram\"\n" +
            "              }\n" +
            "            ],\n" +
            "            \"metrics\": [\n" +
            "              {\n" +
            "                \"$$hashKey\": \"object:1068\",\n" +
            "                \"field\": \"select field\",\n" +
            "                \"id\": \"1\",\n" +
            "                \"type\": \"count\"\n" +
            "              }\n" +
            "            ],\n" +
            "            \"query\": \"agent.hostname : $phostname\",\n" +
            "            \"refId\": \"A\",\n" +
            "            \"timeField\": \"@timestamp\"\n" +
            "          }\n" +
            "        ],\n" +
            "        \"thresholds\": [],\n" +
            "        \"timeFrom\": null,\n" +
            "        \"timeRegions\": [],\n" +
            "        \"timeShift\": null,\n" +
            "        \"title\": \"PacketBeat\",\n" +
            "        \"tooltip\": {\n" +
            "          \"shared\": true,\n" +
            "          \"sort\": 0,\n" +
            "          \"value_type\": \"individual\"\n" +
            "        },\n" +
            "        \"type\": \"graph\",\n" +
            "        \"xaxis\": {\n" +
            "          \"buckets\": null,\n" +
            "          \"mode\": \"time\",\n" +
            "          \"name\": null,\n" +
            "          \"show\": true,\n" +
            "          \"values\": []\n" +
            "        },\n" +
            "        \"yaxes\": [\n" +
            "          {\n" +
            "            \"format\": \"short\",\n" +
            "            \"label\": null,\n" +
            "            \"logBase\": 1,\n" +
            "            \"max\": null,\n" +
            "            \"min\": null,\n" +
            "            \"show\": true\n" +
            "          },\n" +
            "          {\n" +
            "            \"format\": \"short\",\n" +
            "            \"label\": null,\n" +
            "            \"logBase\": 1,\n" +
            "            \"max\": null,\n" +
            "            \"min\": null,\n" +
            "            \"show\": true\n" +
            "          }\n" +
            "        ],\n" +
            "        \"yaxis\": {\n" +
            "          \"align\": false,\n" +
            "          \"alignLevel\": null\n" +
            "        }\n" +
            "      },\n" +
            "      {\n" +
            "        \"aliasColors\": {},\n" +
            "        \"bars\": false,\n" +
            "        \"dashLength\": 10,\n" +
            "        \"dashes\": false,\n" +
            "        \"datasource\": \"Elasticsearch - APM\",\n" +
            "        \"fill\": 1,\n" +
            "        \"fillGradient\": 0,\n" +
            "        \"gridPos\": {\n" +
            "          \"h\": 6,\n" +
            "          \"w\": 12,\n" +
            "          \"x\": 12,\n" +
            "          \"y\": 36\n" +
            "        },\n" +
            "        \"hiddenSeries\": false,\n" +
            "        \"id\": 28,\n" +
            "        \"legend\": {\n" +
            "          \"avg\": false,\n" +
            "          \"current\": false,\n" +
            "          \"max\": false,\n" +
            "          \"min\": false,\n" +
            "          \"show\": true,\n" +
            "          \"total\": false,\n" +
            "          \"values\": false\n" +
            "        },\n" +
            "        \"lines\": true,\n" +
            "        \"linewidth\": 1,\n" +
            "        \"nullPointMode\": \"null\",\n" +
            "        \"options\": {\n" +
            "          \"dataLinks\": []\n" +
            "        },\n" +
            "        \"percentage\": false,\n" +
            "        \"pointradius\": 2,\n" +
            "        \"points\": false,\n" +
            "        \"renderer\": \"flot\",\n" +
            "        \"seriesOverrides\": [],\n" +
            "        \"spaceLength\": 10,\n" +
            "        \"stack\": false,\n" +
            "        \"steppedLine\": false,\n" +
            "        \"targets\": [\n" +
            "          {\n" +
            "            \"bucketAggs\": [\n" +
            "              {\n" +
            "                \"$$hashKey\": \"object:1205\",\n" +
            "                \"field\": \"@timestamp\",\n" +
            "                \"id\": \"2\",\n" +
            "                \"settings\": {\n" +
            "                  \"interval\": \"auto\",\n" +
            "                  \"min_doc_count\": 0,\n" +
            "                  \"trimEdges\": 0\n" +
            "                },\n" +
            "                \"type\": \"date_histogram\"\n" +
            "              }\n" +
            "            ],\n" +
            "            \"metrics\": [\n" +
            "              {\n" +
            "                \"$$hashKey\": \"object:1203\",\n" +
            "                \"field\": \"select field\",\n" +
            "                \"id\": \"1\",\n" +
            "                \"type\": \"count\"\n" +
            "              }\n" +
            "            ],\n" +
            "            \"query\": \"host.hostname : $ahostname\",\n" +
            "            \"refId\": \"A\",\n" +
            "            \"timeField\": \"@timestamp\"\n" +
            "          }\n" +
            "        ],\n" +
            "        \"thresholds\": [],\n" +
            "        \"timeFrom\": null,\n" +
            "        \"timeRegions\": [],\n" +
            "        \"timeShift\": null,\n" +
            "        \"title\": \"APM\",\n" +
            "        \"tooltip\": {\n" +
            "          \"shared\": true,\n" +
            "          \"sort\": 0,\n" +
            "          \"value_type\": \"individual\"\n" +
            "        },\n" +
            "        \"type\": \"graph\",\n" +
            "        \"xaxis\": {\n" +
            "          \"buckets\": null,\n" +
            "          \"mode\": \"time\",\n" +
            "          \"name\": null,\n" +
            "          \"show\": true,\n" +
            "          \"values\": []\n" +
            "        },\n" +
            "        \"yaxes\": [\n" +
            "          {\n" +
            "            \"format\": \"short\",\n" +
            "            \"label\": null,\n" +
            "            \"logBase\": 1,\n" +
            "            \"max\": null,\n" +
            "            \"min\": null,\n" +
            "            \"show\": true\n" +
            "          },\n" +
            "          {\n" +
            "            \"format\": \"short\",\n" +
            "            \"label\": null,\n" +
            "            \"logBase\": 1,\n" +
            "            \"max\": null,\n" +
            "            \"min\": null,\n" +
            "            \"show\": true\n" +
            "          }\n" +
            "        ],\n" +
            "        \"yaxis\": {\n" +
            "          \"align\": false,\n" +
            "          \"alignLevel\": null\n" +
            "        }\n" +
            "      }\n" +
            "    ],\n" +
            "    \"schemaVersion\": 22,\n" +
            "    \"style\": \"dark\",\n" +
            "    \"tags\": [],\n" +
            "    \"templating\": {\n" +
            "      \"list\": [\n" +
            "        {\n" +
            "          \"allValue\": null,\n" +
            "          \"current\": {\n" +
            "            \"text\": \"\",\n" +
            "            \"value\": \"\"\n" +
            "          },\n" +
            "          \"datasource\": \"InfluxDB\",\n" +
            "          \"definition\": \"SHOW TAG VALUES  WITH KEY = \\\"obj\\\" \",\n" +
            "          \"hide\": 0,\n" +
            "          \"includeAll\": false,\n" +
            "          \"index\": -1,\n" +
            "          \"label\": \"obj\",\n" +
            "          \"multi\": false,\n" +
            "          \"name\": \"obj\",\n" +
            "          \"options\": [\n" +
            "            {\n" +
            "              \"$$hashKey\": \"object:1336\",\n" +
            "              \"selected\": false,\n" +
            "              \"text\": \"/16679af642a5/testwww313cokr\",\n" +
            "              \"value\": \"/16679af642a5/testwww313cokr\"\n" +
            "            },\n" +
            "            {\n" +
            "              \"$$hashKey\": \"object:1337\",\n" +
            "              \"selected\": false,\n" +
            "              \"text\": \"/5d6951d245a1/testwww313cokr\",\n" +
            "              \"value\": \"/5d6951d245a1/testwww313cokr\"\n" +
            "            },\n" +
            "            {\n" +
            "              \"$$hashKey\": \"object:1338\",\n" +
            "              \"selected\": false,\n" +
            "              \"text\": \"/6d6ea7e0b0f9/testwww313cokr\",\n" +
            "              \"value\": \"/6d6ea7e0b0f9/testwww313cokr\"\n" +
            "            },\n" +
            "            {\n" +
            "              \"$$hashKey\": \"object:1339\",\n" +
            "              \"selected\": false,\n" +
            "              \"text\": \"/9eb5270bf4fa/www313cokr\",\n" +
            "              \"value\": \"/9eb5270bf4fa/www313cokr\"\n" +
            "            },\n" +
            "            {\n" +
            "              \"$$hashKey\": \"object:1340\",\n" +
            "              \"selected\": false,\n" +
            "              \"text\": \"/9eb75e7e6e3e/www313cokr\",\n" +
            "              \"value\": \"/9eb75e7e6e3e/www313cokr\"\n" +
            "            },\n" +
            "            {\n" +
            "              \"$$hashKey\": \"object:1341\",\n" +
            "              \"selected\": false,\n" +
            "              \"text\": \"/DELLR710-SERVER/dockerTomcat\",\n" +
            "              \"value\": \"/DELLR710-SERVER/dockerTomcat\"\n" +
            "            },\n" +
            "            {\n" +
            "              \"$$hashKey\": \"object:1342\",\n" +
            "              \"selected\": false,\n" +
            "              \"text\": \"/a6bc99072812/www313cokr\",\n" +
            "              \"value\": \"/a6bc99072812/www313cokr\"\n" +
            "            },\n" +
            "            {\n" +
            "              \"$$hashKey\": \"object:1343\",\n" +
            "              \"selected\": false,\n" +
            "              \"text\": \"/bb3d7c3d34d9/www313cokr\",\n" +
            "              \"value\": \"/bb3d7c3d34d9/www313cokr\"\n" +
            "            },\n" +
            "            {\n" +
            "              \"$$hashKey\": \"object:1344\",\n" +
            "              \"selected\": false,\n" +
            "              \"text\": \"/cf91e7a17560/testwww313cokr\",\n" +
            "              \"value\": \"/cf91e7a17560/testwww313cokr\"\n" +
            "            },\n" +
            "            {\n" +
            "              \"$$hashKey\": \"object:1345\",\n" +
            "              \"selected\": false,\n" +
            "              \"text\": \"/ebaf910a5f2a/www313cokr\",\n" +
            "              \"value\": \"/ebaf910a5f2a/www313cokr\"\n" +
            "            },\n" +
            "            {\n" +
            "              \"$$hashKey\": \"object:1346\",\n" +
            "              \"selected\": false,\n" +
            "              \"text\": \"/ef7ac7c4c30b/www313cokr\",\n" +
            "              \"value\": \"/ef7ac7c4c30b/www313cokr\"\n" +
            "            },\n" +
            "            {\n" +
            "              \"$$hashKey\": \"object:1347\",\n" +
            "              \"selected\": false,\n" +
            "              \"text\": \"/ff3377c71608/www313cokr\",\n" +
            "              \"value\": \"/ff3377c71608/www313cokr\"\n" +
            "            },\n" +
            "            {\n" +
            "              \"$$hashKey\": \"object:1348\",\n" +
            "              \"selected\": false,\n" +
            "              \"text\": \"/jstree-backend-5b5746d7cc-9npd2/www313cokr\",\n" +
            "              \"value\": \"/jstree-backend-5b5746d7cc-9npd2/www313cokr\"\n" +
            "            },\n" +
            "            {\n" +
            "              \"$$hashKey\": \"object:1349\",\n" +
            "              \"selected\": false,\n" +
            "              \"text\": \"/jstree-backend-5bdb8776bb-5lklt/www313cokr\",\n" +
            "              \"value\": \"/jstree-backend-5bdb8776bb-5lklt/www313cokr\"\n" +
            "            },\n" +
            "            {\n" +
            "              \"$$hashKey\": \"object:1350\",\n" +
            "              \"selected\": false,\n" +
            "              \"text\": \"/jstree-backend-5bdb8776bb-kqjmg/www313cokr\",\n" +
            "              \"value\": \"/jstree-backend-5bdb8776bb-kqjmg/www313cokr\"\n" +
            "            },\n" +
            "            {\n" +
            "              \"$$hashKey\": \"object:1351\",\n" +
            "              \"selected\": false,\n" +
            "              \"text\": \"/jstree-backend-5c6c68b8ff-m6rrp/www313cokr\",\n" +
            "              \"value\": \"/jstree-backend-5c6c68b8ff-m6rrp/www313cokr\"\n" +
            "            },\n" +
            "            {\n" +
            "              \"$$hashKey\": \"object:1352\",\n" +
            "              \"selected\": false,\n" +
            "              \"text\": \"/jstree-backend-654b68476c-jrtpg/www313cokr\",\n" +
            "              \"value\": \"/jstree-backend-654b68476c-jrtpg/www313cokr\"\n" +
            "            }\n" +
            "          ],\n" +
            "          \"query\": \"SHOW TAG VALUES  WITH KEY = \\\"obj\\\" \",\n" +
            "          \"refresh\": 0,\n" +
            "          \"regex\": \"\",\n" +
            "          \"skipUrlSync\": false,\n" +
            "          \"sort\": 0,\n" +
            "          \"tagValuesQuery\": \"\",\n" +
            "          \"tags\": [],\n" +
            "          \"tagsQuery\": \"\",\n" +
            "          \"type\": \"query\",\n" +
            "          \"useTags\": false\n" +
            "        },\n" +
            "        {\n" +
            "          \"allValue\": null,\n" +
            "          \"current\": {\n" +
            "            \"isNone\": true,\n" +
            "            \"selected\": false,\n" +
            "            \"text\": \"None\",\n" +
            "            \"value\": \"\"\n" +
            "          },\n" +
            "          \"datasource\": \"Elasticsearch - Packetbeat\",\n" +
            "          \"definition\": \"{ \\\"agent.hostname\\\" : \\\"hostname\\\" }\",\n" +
            "          \"hide\": 0,\n" +
            "          \"includeAll\": false,\n" +
            "          \"index\": -1,\n" +
            "          \"label\": \"phostname\",\n" +
            "          \"multi\": false,\n" +
            "          \"name\": \"phostname\",\n" +
            "          \"options\": [\n" +
            "            {\n" +
            "              \"$$hashKey\": \"object:2167\",\n" +
            "              \"isNone\": true,\n" +
            "              \"selected\": true,\n" +
            "              \"text\": \"None\",\n" +
            "              \"value\": \"\"\n" +
            "            }\n" +
            "          ],\n" +
            "          \"query\": \"{ \\\"agent.hostname\\\" : \\\"hostname\\\" }\",\n" +
            "          \"refresh\": 0,\n" +
            "          \"regex\": \"\",\n" +
            "          \"skipUrlSync\": false,\n" +
            "          \"sort\": 0,\n" +
            "          \"tagValuesQuery\": \"\",\n" +
            "          \"tags\": [],\n" +
            "          \"tagsQuery\": \"\",\n" +
            "          \"type\": \"query\",\n" +
            "          \"useTags\": false\n" +
            "        },\n" +
            "        {\n" +
            "          \"allValue\": null,\n" +
            "          \"current\": {\n" +
            "            \"isNone\": true,\n" +
            "            \"selected\": false,\n" +
            "            \"text\": \"None\",\n" +
            "            \"value\": \"\"\n" +
            "          },\n" +
            "          \"datasource\": \"Elasticsearch - Metricbeat\",\n" +
            "          \"definition\": \"{ \\\"agent.hostname\\\" : \\\"hostname\\\" }\",\n" +
            "          \"hide\": 0,\n" +
            "          \"includeAll\": false,\n" +
            "          \"index\": -1,\n" +
            "          \"label\": \"mhostname\",\n" +
            "          \"multi\": false,\n" +
            "          \"name\": \"mhostname\",\n" +
            "          \"options\": [\n" +
            "            {\n" +
            "              \"$$hashKey\": \"object:1836\",\n" +
            "              \"isNone\": true,\n" +
            "              \"selected\": true,\n" +
            "              \"text\": \"None\",\n" +
            "              \"value\": \"\"\n" +
            "            }\n" +
            "          ],\n" +
            "          \"query\": \"{ \\\"agent.hostname\\\" : \\\"hostname\\\" }\",\n" +
            "          \"refresh\": 0,\n" +
            "          \"regex\": \"\",\n" +
            "          \"skipUrlSync\": false,\n" +
            "          \"sort\": 0,\n" +
            "          \"tagValuesQuery\": \"\",\n" +
            "          \"tags\": [],\n" +
            "          \"tagsQuery\": \"\",\n" +
            "          \"type\": \"query\",\n" +
            "          \"useTags\": false\n" +
            "        },\n" +
            "        {\n" +
            "          \"allValue\": null,\n" +
            "          \"current\": {\n" +
            "            \"isNone\": true,\n" +
            "            \"selected\": false,\n" +
            "            \"text\": \"None\",\n" +
            "            \"value\": \"\"\n" +
            "          },\n" +
            "          \"datasource\": \"Elasticsearch - APM\",\n" +
            "          \"definition\": \"{ \\\"agent.hostname\\\" : \\\"hostname\\\" }\",\n" +
            "          \"hide\": 0,\n" +
            "          \"includeAll\": false,\n" +
            "          \"index\": -1,\n" +
            "          \"label\": \"ahostname\",\n" +
            "          \"multi\": false,\n" +
            "          \"name\": \"ahostname\",\n" +
            "          \"options\": [\n" +
            "            {\n" +
            "              \"$$hashKey\": \"object:1904\",\n" +
            "              \"isNone\": true,\n" +
            "              \"selected\": true,\n" +
            "              \"text\": \"None\",\n" +
            "              \"value\": \"\"\n" +
            "            }\n" +
            "          ],\n" +
            "          \"query\": \"{ \\\"agent.hostname\\\" : \\\"hostname\\\" }\",\n" +
            "          \"refresh\": 0,\n" +
            "          \"regex\": \"\",\n" +
            "          \"skipUrlSync\": false,\n" +
            "          \"sort\": 0,\n" +
            "          \"tagValuesQuery\": \"\",\n" +
            "          \"tags\": [],\n" +
            "          \"tagsQuery\": \"\",\n" +
            "          \"type\": \"query\",\n" +
            "          \"useTags\": false\n" +
            "        },\n" +
            "        {\n" +
            "          \"allValue\": null,\n" +
            "          \"current\": {\n" +
            "            \"isNone\": true,\n" +
            "            \"selected\": false,\n" +
            "            \"text\": \"None\",\n" +
            "            \"value\": \"\"\n" +
            "          },\n" +
            "          \"datasource\": \"Elasticsearch - Filebeat\",\n" +
            "          \"definition\": \"{ \\\"agent.hostname\\\" : \\\"hostname\\\" }\",\n" +
            "          \"hide\": 0,\n" +
            "          \"includeAll\": false,\n" +
            "          \"index\": -1,\n" +
            "          \"label\": \"fhostname\",\n" +
            "          \"multi\": false,\n" +
            "          \"name\": \"fhostname\",\n" +
            "          \"options\": [\n" +
            "            {\n" +
            "              \"$$hashKey\": \"object:2079\",\n" +
            "              \"isNone\": true,\n" +
            "              \"selected\": true,\n" +
            "              \"text\": \"None\",\n" +
            "              \"value\": \"\"\n" +
            "            }\n" +
            "          ],\n" +
            "          \"query\": \"{ \\\"agent.hostname\\\" : \\\"hostname\\\" }\",\n" +
            "          \"refresh\": 0,\n" +
            "          \"regex\": \"\",\n" +
            "          \"skipUrlSync\": false,\n" +
            "          \"sort\": 0,\n" +
            "          \"tagValuesQuery\": \"\",\n" +
            "          \"tags\": [],\n" +
            "          \"tagsQuery\": \"\",\n" +
            "          \"type\": \"query\",\n" +
            "          \"useTags\": false\n" +
            "        },\n" +
            "        {\n" +
            "          \"allValue\": null,\n" +
            "          \"current\": {\n" +
            "            \"isNone\": true,\n" +
            "            \"selected\": false,\n" +
            "            \"text\": \"None\",\n" +
            "            \"value\": \"\"\n" +
            "          },\n" +
            "          \"datasource\": \"Elasticsearch - Heartbeat\",\n" +
            "          \"definition\": \"{ \\\"agent.hostname\\\" : \\\"hostname\\\" }\",\n" +
            "          \"hide\": 0,\n" +
            "          \"includeAll\": false,\n" +
            "          \"index\": -1,\n" +
            "          \"label\": \"hhostname\",\n" +
            "          \"multi\": false,\n" +
            "          \"name\": \"hhostname\",\n" +
            "          \"options\": [\n" +
            "            {\n" +
            "              \"$$hashKey\": \"object:2125\",\n" +
            "              \"isNone\": true,\n" +
            "              \"selected\": true,\n" +
            "              \"text\": \"None\",\n" +
            "              \"value\": \"\"\n" +
            "            }\n" +
            "          ],\n" +
            "          \"query\": \"{ \\\"agent.hostname\\\" : \\\"hostname\\\" }\",\n" +
            "          \"refresh\": 0,\n" +
            "          \"regex\": \"\",\n" +
            "          \"skipUrlSync\": false,\n" +
            "          \"sort\": 0,\n" +
            "          \"tagValuesQuery\": \"\",\n" +
            "          \"tags\": [],\n" +
            "          \"tagsQuery\": \"\",\n" +
            "          \"type\": \"query\",\n" +
            "          \"useTags\": false\n" +
            "        },\n" +
            "        {\n" +
            "          \"allValue\": null,\n" +
            "          \"current\": {\n" +
            "            \"isNone\": true,\n" +
            "            \"selected\": false,\n" +
            "            \"text\": \"None\",\n" +
            "            \"value\": \"\"\n" +
            "          },\n" +
            "          \"datasource\": \"Elasticsearch - Topbeat\",\n" +
            "          \"definition\": \"{ \\\"beat.hostname\\\" : \\\"hostname\\\" }\",\n" +
            "          \"hide\": 0,\n" +
            "          \"includeAll\": false,\n" +
            "          \"index\": -1,\n" +
            "          \"label\": \"thostname\",\n" +
            "          \"multi\": false,\n" +
            "          \"name\": \"thostname\",\n" +
            "          \"options\": [\n" +
            "            {\n" +
            "              \"$$hashKey\": \"object:6979\",\n" +
            "              \"isNone\": true,\n" +
            "              \"selected\": true,\n" +
            "              \"text\": \"None\",\n" +
            "              \"value\": \"\"\n" +
            "            }\n" +
            "          ],\n" +
            "          \"query\": \"{ \\\"beat.hostname\\\" : \\\"hostname\\\" }\",\n" +
            "          \"refresh\": 0,\n" +
            "          \"regex\": \"\",\n" +
            "          \"skipUrlSync\": false,\n" +
            "          \"sort\": 0,\n" +
            "          \"tagValuesQuery\": \"\",\n" +
            "          \"tags\": [],\n" +
            "          \"tagsQuery\": \"\",\n" +
            "          \"type\": \"query\",\n" +
            "          \"useTags\": false\n" +
            "        }\n" +
            "      ]\n" +
            "    },\n" +
            "    \"time\": {\n" +
            "      \"from\": \"now-6h\",\n" +
            "      \"to\": \"now\"\n" +
            "    },\n" +
            "    \"timepicker\": {\n" +
            "      \"refresh_intervals\": [\n" +
            "        \"5s\",\n" +
            "        \"10s\",\n" +
            "        \"30s\",\n" +
            "        \"1m\",\n" +
            "        \"5m\",\n" +
            "        \"15m\",\n" +
            "        \"30m\",\n" +
            "        \"1h\",\n" +
            "        \"2h\",\n" +
            "        \"1d\"\n" +
            "      ]\n" +
            "    },\n" +
            "    \"timezone\": \"browser\",\n" +
            "    \"title\": \"All in one Dashbard\",\n" +
            "    \"uid\": \"null\",\n" +
            "    \"variables\": {\n" +
            "      \"list\": []\n" +
            "    },\n" +
            "    \"version\": 37\n" +
            "  }\n" +
            "}";
}

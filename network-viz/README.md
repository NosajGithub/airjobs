# AirJobs: Jobs Viz-a-Viz
*BayesHack 2016 Project*

## Motivation

We worked on the <a href="http://www.bls.gov/home.htm">Bureau of Labour Statistics</a> (BLS) database to build a tool to enable job seekers to explore the whole universe of jobs in the United States of America. We want to help people with work experience to find jobs related to their current or past employment. The hope is that:<br>

a) employees with jobs most at risk of **automation** in the next 20 years can find similar jobs with a lower probability of automation;<br>
b) employees interested in exploring **green** employment can find jobs similar to their current or past employment.<br>

## Approach

For each of the 954 jobs in the BLS database, we compute the the coordinates of the job in the 35-dimensional space of skills. These skills are designated by the BLS and include ones such as: *Reading Comprehension*, *Active Listening*, *Writing*, etc.

For each pair of jobs in this skills vector space, we calculate the distance between them using the <a href="Kullback-Leibler Divergence">https://en.wikipedia.org/wiki/Kullback%E2%80%93Leibler_divergence</a> to give us a scalar. The smaller the distance (*divergence*), the more similar two jobs are in terms of the skills required to be competent in the jobs.

## Output

A user landing on the front page will see the entire universe of jobs:<br>
<img src="airjobs_vizaviz_1.png" style="width:90%;height:90%;">

And then, suppose, a carpenter, called Sarah, say, is interested in similar jobs to her's then she can search for it in the left pane and see it's network of related jobs:<br>
<img src="airjobs_vizaviz_2.png" style="width:90%;height:90%;">

Suppose Sarah likes the sound of *Tile and Marble Setters*, then she can click the title in the right pane and it will take her to the <a href="http://www.onetcenter.org/">ONet website</a> where Sarah can find out more about the job and opportunities to get into it:<br>
<img src="airjobs_vizaviz_3.png" style="width:90%;height:90%;">

## Feedback

Please let us know what you think and what more you would like to see!